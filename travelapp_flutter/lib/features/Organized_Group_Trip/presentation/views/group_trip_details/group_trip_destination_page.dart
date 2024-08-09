import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_oval_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_date_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_destination_flight.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_destination_hotel.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/6_schedule_page.dart';

class GroupTripDestinationPage extends StatelessWidget {
  const GroupTripDestinationPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(Assets.nature1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '1. United States',
                        style: Styles.heading,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    CustomOvalButton(
                      label: 'Schedule',
                      color: Themes.third,
                      onPressed: () {
                        Get.to(() => SchedulePage(
                              destinations: [
                                DestinationsModel(
                                  city: 'Las Vegas',
                                  country: 'United States',
                                  days: 3,
                                ),
                                DestinationsModel(
                                  city: 'Asyut',
                                  country: 'Egypt',
                                  days: 3,
                                ),
                                DestinationsModel(
                                  city: 'Damascus',
                                  country: 'Syria',
                                  days: 3,
                                ),
                              ],
                              initialDestination: index,
                              isEditable: false,
                              isShowDetails: true,
                              onScheduleDone: (schedule, places) {
                                Get.back();
                              },
                            ));
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const TripDateInfo(
                  startDate: '20/08/2024',
                  endDate: '13/09/2024',
                  days: '4',
                ),
                const SizedBox(height: 32),
                const TripDestinationFlight(),
                const SizedBox(height: 32),
                const TripDestinationHotel()
              ],
            ),
          )
        ],
      ),
    );
  }
}
