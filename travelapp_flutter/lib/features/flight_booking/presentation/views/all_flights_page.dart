import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/all_flights_page_body.dart';

class AllFlightsPage extends StatelessWidget {
  const AllFlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AllFlightsCubit, AllFlightsStates>(
          builder: (context, state) {
            if (state is FailureGetAllFlightsState) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const AllFlightsPageBody();
            }
          },
        ),
      ),
    );
  }
}
