import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_states.dart';

class FlightsPagination extends StatelessWidget {
  const FlightsPagination({
    super.key,
  });

  // late NumberPaginatorController _controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFlightsCubit, AllFlightsStates>(
      builder: (context, state) {
        if (state is SuccessGetAllFlightsState) {
          int totalFlights =
              BlocProvider.of<AllFlightsCubit>(context).totalFlights;
          int pages = (totalFlights / flightsInSinglePage).ceil();
          if (pages <= 1) {
            return const SliverToBoxAdapter(
              child: SizedBox(),
            );
          }
          return SliverToBoxAdapter(
            child: NumberPaginator(
              // controller: _controller,
              numberPages: pages,
              initialPage: BlocProvider.of<AllFlightsCubit>(context).page - 1,
              onPageChange: (index) async {
                await BlocProvider.of<AllFlightsCubit>(context)
                    .changePage(index + 1);
              },
              config: NumberPaginatorUIConfig(
                buttonSelectedBackgroundColor: Themes.primary,
                buttonUnselectedForegroundColor: Themes.third,
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
