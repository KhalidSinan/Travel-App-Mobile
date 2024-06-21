import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/all_flights_options.dart';

class AllFlightsHeader extends StatelessWidget {
  const AllFlightsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFlightsCubit, AllFlightsStates>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
                    children: [
                      Text(
                        'All Flights',
                        style: Styles.heading,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(${BlocProvider.of<AllFlightsCubit>(context).totalFlights})',
                        style: Styles.subtitle,
                      ),
                    ],
                  ),
            (state is LoadingGetAllFlightsState)
                ? const SizedBox()
                : const AllFlightsOptions()
          ],
        );
      },
    );
  }
}
