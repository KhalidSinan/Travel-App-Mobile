import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/flight_details_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/available_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/filtering_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';

class TicketCard extends StatelessWidget {
  const TicketCard(
      {super.key, required this.flightData, required this.filters});
  final AvailableFlightModel flightData;
  final FilterModel? filters;

  @override
  Widget build(BuildContext context) {
    String timeStart = filters?.timeStart ?? '00:00 AM';
    String timeEnd = filters?.timeEnd ?? '11:59 PM';
    double minPrice = filters?.minPrice ?? 0;
    double? maxPrice = filters?.maxPrice == 0.0 || filters?.maxPrice == null
        ? 1500
        : filters?.maxPrice;
    return Container(
      height: flightData.reason == 'No Flights Available' ? 100 : 220,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: flightData.reason == 'Flights Available'
              ? Themes.primary
              : flightData.reason == 'No Flights Available'
                  ? Colors.black54
                  : Themes.third,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            flightData.city,
            style: GoogleFonts.quattrocento().copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          if (flightData.reason == 'Flights Available')
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flightData.flight!.airline.name,
                    style: const TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.moneyCheckDollar,
                        color: Themes.third,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        flightData.flight!.price.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Themes.third,
                        size: 23,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        flightData.flight!.departureDate.date,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.5),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          FlightDetailsPage(
                            id: flightData.flight!.id,
                            classType:
                                '${BlocProvider.of<OrganizingTripCubit>(context).classType}',
                            seats: BlocProvider.of<OrganizingTripCubit>(context)
                                .numberPerson!,
                            visible: false,
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Details',
                            style:
                                TextStyle(fontSize: 16, color: Themes.primary),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Themes.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (flightData.reason == "The Filter Criteria Doesn't Match Flights")
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.filter,
                        color: Themes.third,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Filtered by :',
                        style: TextStyle(fontSize: 15, color: Themes.third),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    filters?.airline ?? 'All airlines',
                    style: const TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${minPrice.toString()} _ \$${maxPrice.toString()}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$timeStart _ $timeEnd',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          if (flightData.reason == 'No Flights Available')
            const Text(
              'There is no available airports',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
        ],
      ),
    );
  }
}
