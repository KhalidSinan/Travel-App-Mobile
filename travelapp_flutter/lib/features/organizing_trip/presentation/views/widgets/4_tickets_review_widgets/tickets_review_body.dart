import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/available_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/4_tickets_review_widgets/tickets_row.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';

class TicketsReviewBody extends StatefulWidget {
  const TicketsReviewBody({super.key});
  @override
  State<TicketsReviewBody> createState() => _TicketsReviewBodyState();
}

class _TicketsReviewBodyState extends State<TicketsReviewBody> {
  List<AvailableFlightModel>? flights;
  List<DestinationsModel>? destinations;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizingTripCubit, OrganizingTripStates>(
      builder: (context, state) {
        flights =
            BlocProvider.of<OrganizingTripCubit>(context).availableFlightModel;
        destinations = BlocProvider.of<OrganizingTripCubit>(context).destinations;
        if (state is LoadingOrganizingTrip) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: flights!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TicketsRow(flightData: flights![index], filters: destinations![index].filter!),
                          if (allAvailable() == true &&
                              index == flights!.length - 1)
                            Column(
                              children: [
                                SizedBox(
                                    height: flights!.length == 1
                                        ? MediaQuery.of(context).size.height *
                                            0.56
                                        : flights!.length == 2
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *

                                                0.25
                                            : flights!.length == 3
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.05
                                                : 0),
                               Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: NextButton(onTap: () {
                                BlocProvider.of<OrganizingTripCubit>(context)
                                    .getStartDate();
                                BlocProvider.of<OrganizingTripCubit>(context)
                                    .createTripSchedule();
                                BlocProvider.of<OrganizingTripCubit>(context)
                                    .createCurrentSteps();
                              }),
                                )
                              ],
                            )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  bool allAvailable() {
    int counter = 0;
    for (var i = 0; i < flights!.length; i++) {
      if (flights![i].isAvailable == true) {
        counter++;
      }
    }
    if (counter == flights!.length) {
      return true;
    } else {
      return false;
    }
  }
}
