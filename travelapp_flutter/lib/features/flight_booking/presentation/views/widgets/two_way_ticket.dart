import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/dash_line_divider.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/two_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/flight_details_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/airline_info.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/country_info.dart';
import '../../../../../core/helpers/custom_ticket_shape.dart';

class TwoWayTicket extends StatelessWidget {
  const TwoWayTicket({
    super.key,
    required this.flight,
  });
  final TwoWayFlightModel flight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => FlightDetailsPage(
            id: flight.flight.id!,
            idback: flight.flightBack.id,
            classType: BlocProvider.of<AllFlightsCubit>(context).seatsClass!,
            seats: BlocProvider.of<AllFlightsCubit>(context).seats!,
          ),
        );
      },
      child: ClipPath(
        clipper: CustomTwoWayTicketShape(),
        child: Container(
          // height: 250,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: Themes.primary, width: 3),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AirlineInfo(
                    airline: flight.flight.airline,
                  ),
                  Text(
                    flight.flight.duration,
                    style: Styles.subtitle.copyWith(
                      // color: Colors.white54,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CountryInfo(
                source: flight.flight.source.city,
                destination: flight.flight.destination.city,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    flight.flight.departure.date,
                    style: Styles.subtitle.copyWith(
                      // color: Colors.white54,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    flight.flight.arrival.date,
                    style: Styles.subtitle.copyWith(
                      // color: Colors.white54,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AirlineInfo(
                    airline: flight.flightBack.airline,
                  ),
                  Text(
                    flight.flightBack.duration,
                    style: Styles.subtitle.copyWith(
                      // color: Colors.white54,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CountryInfo(
                source: flight.flightBack.source.city,
                destination: flight.flightBack.destination.city,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    flight.flightBack.departure.date,
                    style: Styles.subtitle.copyWith(
                      // color: Colors.white54,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    flight.flightBack.arrival.date,
                    style: Styles.subtitle.copyWith(
                      // color: Colors.white54,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const DashLineDivider(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    flight.flight.departure.time!,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    '${flight.overallPrice}\$',
                    style: Styles.heading.copyWith(
                      fontSize: 24,
                      color: Themes.third,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
