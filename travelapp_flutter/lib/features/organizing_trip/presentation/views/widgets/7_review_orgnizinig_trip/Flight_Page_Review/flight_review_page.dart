import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Flight_Page_Review/flight_review_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightPageReview extends StatelessWidget {
  const FlightPageReview({super.key});

  @override
  Widget build(BuildContext context) {
    final trip = BlocProvider.of<OrganizingTripCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(298),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(25)),
              color: Themes.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                const CustomBackButton(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Informations About Your Selected Flights",
                  style: TextStyle(
                      color: Themes.third,
                      fontWeight: FontWeight.w200,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Total journey Number Flight : ${trip.availableFlightModel.length}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  "Total Price of Flights : ${trip.getTotalFlightsPrice()}\$",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  "Class Type : ${trip.getSeatClass()}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
      body: const FlightReviewBody(),
    );
  }
}
