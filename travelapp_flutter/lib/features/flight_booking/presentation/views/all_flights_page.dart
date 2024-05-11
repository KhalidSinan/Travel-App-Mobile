import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/all_flights_page_body.dart';

class AllFlightsPage extends StatelessWidget {
  const AllFlightsPage({
    super.key,
    required this.flights,
    required this.isTwoWay,
    required this.departureDate,
    required this.source,
    required this.destination,
    required this.seats,
    required this.seatsClass,
    this.dateEnd,
    required this.airlines,
  });
  final List<dynamic> flights;
  final bool isTwoWay;
  final String departureDate;
  final String source;
  final String destination;
  final int seats;
  final String seatsClass;
  final String? dateEnd;
  final List<dynamic> airlines;

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<AllFlightsCubit>(context).initialize(
    //   flights,
    //   isTwoWay,
    //   departureDate,
    //   source,
    //   destination,
    //   seats,
    //   seatsClass,
    //   dateEnd,
    // );
    return BlocProvider(
      create: (context) => AllFlightsCubit(getIt.get<FlightBookingImp>())
        ..initialize(
          flights,
          airlines,
          isTwoWay,
          departureDate,
          source,
          destination,
          seats,
          seatsClass,
          dateEnd,
        ),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AllFlightsCubit, AllFlightsStates>(
            builder: (context, state) {
              if (state is FailureGetAllFlightsState) {
                return FailurePage(
                  error: state.failure,
                  onPressed: () async {
                    await BlocProvider.of<AllFlightsCubit>(context).retry();
                  },
                );
              } else {
                return const AllFlightsPageBody();
              }
            },
          ),
        ),
      ),
    );
  }
}
