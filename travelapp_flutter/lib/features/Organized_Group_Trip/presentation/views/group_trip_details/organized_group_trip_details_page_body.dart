import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_destination_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_footer.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_info_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_pricing_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/form_page.dart';

class OrganizedGroupTripDetailsPageBody extends StatefulWidget {
  const OrganizedGroupTripDetailsPageBody({super.key});
  @override
  State<OrganizedGroupTripDetailsPageBody> createState() =>
      _OrganizedGroupTripDetailsPageBodyState();
}

class _OrganizedGroupTripDetailsPageBodyState
    extends State<OrganizedGroupTripDetailsPageBody> {
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groupTrip = BlocProvider.of<GroupTripDetailsCubit>(context).groupTrip;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const GroupTripInfoPage(),
              ...List.generate(
                groupTrip!.destinations.length,
                (index) {
                  return GroupTripDestinationPage(
                    index: index,
                    destination: groupTrip.destinations[index],
                  );
                },
              ),
              const GroupTripPricingPage(),
            ],
          ),
        ),
        BlocBuilder<GroupTripDetailsCubit, GroupTripDetailsState>(
          builder: (context, state) => GroupTripFooter(
            currentDestination: BlocProvider.of<GroupTripDetailsCubit>(context)
                .currentDestination,
            isBack: BlocProvider.of<GroupTripDetailsCubit>(context).isBack,
            controller: controller,
          ),
        ),
      ],
    );
  }

  void onPageChanged(index) {
    final groupTrip = BlocProvider.of<GroupTripDetailsCubit>(context);
    final destinations = groupTrip.groupTrip!.destinations;
    final subscribed = groupTrip.subscribed;
    final isOrganizer = groupTrip.isOrganizer;
    if (index == destinations.length) {
      BlocProvider.of<GroupTripDetailsCubit>(context)
          .setCurrentDestination('Pricing');
      return;
    }
    // if (index == destinations.length + 1 && subscribed) {
    //   BlocProvider.of<GroupTripDetailsCubit>(context)
    //       .setCurrentDestination('Cancel Reservation');
    //   return;
    // }
    if (index == destinations.length + 1 && (subscribed || isOrganizer)) {
      BlocProvider.of<GroupTripDetailsCubit>(context)
          .setCurrentDestination('Participants');
      return;
    }
    if (index == destinations.length + 1) {
      BlocProvider.of<GroupTripDetailsCubit>(context)
          .setCurrentDestination('Pay');
      return;
    }
    BlocProvider.of<GroupTripDetailsCubit>(context).showIsBack(index);
    BlocProvider.of<GroupTripDetailsCubit>(context)
        .setCurrentDestination(destinations[index].destination.city);
  }
}
