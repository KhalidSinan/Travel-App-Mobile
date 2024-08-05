import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
        bool returnHome =
            BlocProvider.of<OrganizingTripCubit>(context).returnHome;
        destinations =
            BlocProvider.of<OrganizingTripCubit>(context).destinations;
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
                    itemCount: flights!.length - (returnHome ? 1 : 0),
                    itemBuilder: (context, index) {
                      return TicketsRow(
                        flightData: flights![index],
                        filters: destinations![index].filter!,
                      );
                    },
                  ),
                ),
                (allAvailable() == true)
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: NextButton(
                          onTap: () {
                            BlocProvider.of<OrganizingTripCubit>(context)
                                .getStartDate();
                            BlocProvider.of<OrganizingTripCubit>(context)
                                .createTripSchedule();
                            BlocProvider.of<OrganizingTripCubit>(context)
                                .createCurrentSteps();
                            Get.toNamed('/hotels');
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          );
        }
      },
    );
  }

  bool allAvailable() {
    for (var i = 0; i < flights!.length; i++) {
      if (flights![i].isAvailable == false) {
        return false;
      }
    }
    return true;
  }
}
