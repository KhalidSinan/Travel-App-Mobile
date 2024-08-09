import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/trip_status.dart';
import 'package:travelapp_flutter/core/widgets/custom_oval_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_status.dart';

class GroupTripFooter extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Offstage(
            offstage: isBack,
            child: const GroupTripStatus(
              status: TripStatus.waiting,
            ),
          ),
          Offstage(
            offstage: !isBack,
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
              label: '$currentDestination >',
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }

  void onNext() {
    controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onBack() {
    controller.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
