import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/open_flight.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/open_hotel.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/open_places.dart';

class ReviewOrgnizingTripBody extends StatelessWidget {
  const ReviewOrgnizingTripBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OpenHotel(),
              OpenFlight(),
            ],
          ),
          const OpenPlaces(),
          SizedBox(
              width: double.infinity,
              child: CustomButton(onPressed: () {}, label: "Reviewed")),
        ],
      ),
    );
  }
}
