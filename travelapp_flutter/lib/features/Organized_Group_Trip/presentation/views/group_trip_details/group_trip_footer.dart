import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_oval_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/destinations_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_status.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/participants_number_sheet.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_participants.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/form_page.dart';

class GroupTripFooter extends StatefulWidget {
  const GroupTripFooter({
    super.key,
    required this.currentDestination,
    required this.controller,
    required this.isBack,
  });

  final String currentDestination;
  final PageController controller;
  final bool isBack;

  @override
  State<GroupTripFooter> createState() => _GroupTripFooterState();
}

class _GroupTripFooterState extends State<GroupTripFooter> {
  @override
  Widget build(BuildContext context) {
    final tripStatus =
        BlocProvider.of<GroupTripDetailsCubit>(context).groupTrip!.status;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Offstage(
            offstage: widget.isBack,
            child: GroupTripStatus(
              status: tripStatus,
            ),
          ),
          Offstage(
            offstage: !widget.isBack,
            child: IconButton(
              icon: const Icon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.black,
              ),
              onPressed: onBack,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: CustomOvalButton(
              label: '${widget.currentDestination} >',
              onPressed: onNext,
              color: getButtonColor(),
            ),
          ),
        ],
      ),
    );
  }

  Color getButtonColor() {
    final groupTrip = BlocProvider.of<GroupTripDetailsCubit>(context);
    final subscribed = groupTrip.subscribed;
    final currentDestination = groupTrip.currentDestination;
    if (subscribed && currentDestination == 'Cancel Reservation') {
      return Colors.red;
    } else {
      return Themes.primary;
    }
  }

  void onNext() {
    if (widget.currentDestination == 'Pay') {
      participantsNumberSheet();
      return;
    }
    if (widget.currentDestination == 'Participants') {
      final tripId = BlocProvider.of<GroupTripDetailsCubit>(context).tripId;
      final isOrganizer =
          BlocProvider.of<GroupTripDetailsCubit>(context).isOrganizer;
      Get.to(() => GroupTripParticipantsPage(
            tripId: tripId,
            isOrganizer: isOrganizer,
          ));
      return;
    }
    // if (widget.currentDestination == 'Cancel Reservation') {
    //   final tripId = BlocProvider.of<GroupTripDetailsCubit>(context).tripId;
    //   Get.to(() => GroupTripParticipantsPage(tripId: tripId));
    //   return;
    // }
    widget.controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void participantsNumberSheet() {
    Get.bottomSheet(ParticipantsNumberSheet(
      controller: widget.controller,
      onDone: (participants) {
        Get.to(() => FormPage(
              seats: participants,
              classType: '',
              subscribeFormId:
                  BlocProvider.of<GroupTripDetailsCubit>(context).tripId,
            ));
      },
    ));
  }

  void onBack() {
    widget.controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
