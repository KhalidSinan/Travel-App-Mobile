import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_states.dart';

class FlightsPagination extends StatefulWidget {
  const FlightsPagination({
    super.key,
  });

  @override
  State<FlightsPagination> createState() => _FlightsPaginationState();
}

class _FlightsPaginationState extends State<FlightsPagination> {
  late NumberPaginatorController _controller;
  @override
  void initState() {
    super.initState();
    _controller = NumberPaginatorController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFlightsCubit, AllFlightsStates>(
      builder: (context, state) {
        if (state is SuccessGetAllFlightsState) {
          int pages = getPages();
          if (pages <= 1) {
            return const SliverToBoxAdapter(
              child: SizedBox(),
            );
          }
          return SliverToBoxAdapter(
            child: NumberPaginator(
              controller: _controller,
              numberPages: pages,
              onPageChange: onPageChange,
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

  int getPages() {
    int flightsNumber =
        BlocProvider.of<AllFlightsCubit>(context).flights!.length;
    return (flightsNumber / flightsInSinglePage).ceil();
  }

  onPageChange(index) async {
    final flightsCubit = BlocProvider.of<AllFlightsCubit>(context);
    _controller.navigateToPage(index);
    setState(() {});
    if (flightsCubit.isTwoWay) {
      await flightsCubit.getAllTwoWayFlights(
        source: 'Venezuela',
        destination: 'Russia',
        date: '06/05/2024',
        seats: 1,
        seatsClass: 'A',
        dateEnd: '10/05/2024',
        page: index,
      );
    } else {
      await flightsCubit.getAllOneWayFlights(
        source: 'United States',
        destination: 'Russia',
        date: '09/05/2024',
        seats: 1,
        seatsClass: 'A',
        page: index,
      );
    }
  }
}
