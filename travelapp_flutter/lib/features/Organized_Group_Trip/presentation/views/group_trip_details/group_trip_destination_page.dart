import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_oval_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/trip_destination_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_date_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_destination_flight.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_destination_hotel.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/6_schedule_page.dart';

class GroupTripDestinationPage extends StatelessWidget {
  const GroupTripDestinationPage(
      {super.key, required this.destination, required this.index});
  final int index;
  final TripDestinationModel destination;

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
                        '${index + 1}. ${destination.destination.city}',
                        style: Styles.heading,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Offstage(
                      offstage: index ==
                          BlocProvider.of<GroupTripDetailsCubit>(context)
                                  .groupTrip!
                                  .destinations
                                  .length -
                              1,
                      child: CustomOvalButton(
                        label: 'Schedule',
                        color: Themes.third,
                        onPressed: () {
                          final destinations =
                              BlocProvider.of<GroupTripDetailsCubit>(context)
                                  .groupTrip!
                                  .destinations;
                          Get.to(() => SchedulePage(
                                tripId: BlocProvider.of<GroupTripDetailsCubit>(
                                        context)
                                    .tripId,
                                destinations: List.generate(
                                    destinations.length - 1, (index) {
                                  return DestinationsModel(
                                    city: destinations[index].destination.city,
                                    country: destinations[index]
                                        .destination
                                        .country!,
                                    days: destinations[index].days,
                                  );
                                }),
                                initialDestination: index,
                                isEditable: false,
                                isShowDetails: true,
                                onScheduleDone: (schedule, places) {
                                  Get.back();
                                },
                              ));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TripDateInfo(
                  startDate: destination.startDate,
                  endDate: destination.endDate,
                  days: destination.days.toString(),
                ),
                const SizedBox(height: 32),
                TripDestinationFlight(
                  ticket: destination.ticket,
                ),
                const SizedBox(height: 32),
                TripDestinationHotel(
                  hotel: destination.hotel,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
