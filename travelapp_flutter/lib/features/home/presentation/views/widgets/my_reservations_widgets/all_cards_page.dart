import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/home/data/models/flight_reservations_model.dart';
import 'package:travelapp_flutter/features/home/data/models/group_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/models/hotel_reservations_model.dart';
import 'package:travelapp_flutter/features/home/data/models/organizer_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/models/single_trips_model.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/flights_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/hotel_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/group_trips_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/single_trip_box.dart';

class AllCardsPage extends StatelessWidget {
  const AllCardsPage({
    super.key,
    this.type,
    this.flights,
    this.hotels,
    this.single,
    this.group,
    this.organizer,
  });
  final String? type;
  final List<FlightReservationsModel>? flights;
  final List<HotelReservationsModel>? hotels;
  final List<SingleTripsModel>? single;
  final List<GroupTripsModel>? group;
  final List<OrganizerTripsModel>? organizer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: type == 'flights'
            ? Text(
                'Flight reservations',
                style: Styles.heading2,
              )
            : type == 'hotels'
                ? Text(
                    'Hotel reservations',
                    style: Styles.heading2,
                  )
                : type == 'single'
                    ? Text(
                        'Single trips',
                        style: Styles.heading2,
                      )
                    : type == 'group'
                        ? Text(
                            'Group trips',
                            style: Styles.heading2,
                          )
                        : null,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: type == 'flights'
            ? flights!.length
            : type == 'hotels'
                ? hotels!.length
                : type == 'single'
                    ? single!.length
                    : type == 'group'
                        ? group!.length
                        : 1,
        itemBuilder: (context, index) {
          if (type == 'flights') {
            return FlightsBox(flight: flights![index]);
          } else if (type == 'hotels') {
            return HotelBox(hotel: hotels![index]);
          } else if (type == 'single') {
            return SingleTripBox(single: single![index]);
          } else if (type == 'group') {
            return GroupTripBox(group: group![index], isOrganizer: false);
          } else {
            return GroupTripBox(
                organizer: organizer![index], isOrganizer: true);
          }
        },
      ),
    );
  }
}
