import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/helpers/custom_ticket_shape.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/one_way_ticket.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/two_way_ticket.dart';

class FlightsList extends StatelessWidget {
  const FlightsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFlightsCubit, AllFlightsStates>(
        builder: (context, state) {
      if (state is NoFlightsState) {
        return const SliverFillRemaining(
          child: Center(child: Text('No Flights Available')),
        );
      } else if (state is LoadingGetAllFlightsState) {
        return SliverList.builder(
          itemBuilder: loadingTicketBuilder,
          itemCount: 10,
        );
      } else if (state is SuccessGetAllFlightsState) {
        bool isTwoWay = BlocProvider.of<AllFlightsCubit>(context).isTwoWay;
        return SliverList.builder(
          itemBuilder: isTwoWay ? twoWayTicketBuilder : oneWayTicketBuilder,
          itemCount: BlocProvider.of<AllFlightsCubit>(context).flights!.length,
        );
      } else {
        return const SizedBox();
      }
    });
  }

  Widget? loadingTicketBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClipPath(
        clipper: CustomOneWayTicketShape(),
        child: Shimmer.fromColors(
          period: const Duration(milliseconds: 2000),
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
          child: Container(
            height: 245,
            decoration: BoxDecoration(
              color: Themes.secondary,
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }

  Widget? oneWayTicketBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: OneWayTicket(
        flight: BlocProvider.of<AllFlightsCubit>(context).flights![index],
      ),
    );
  }

  Widget? twoWayTicketBuilder(context, index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TwoWayTicket(
        flight: BlocProvider.of<AllFlightsCubit>(context).flights![index],
      ),
    );
  }
}
