import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Flight_Page_Review/flight_review_page.dart';

class OpenFlight extends StatelessWidget {
  const OpenFlight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        transitionDuration: const Duration(seconds: 1),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) {
          return SizedBox(
            height: 180,
            width: 160,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("assets/images/flight_review.jpg"),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text("Selected Flights")
              ],
            ),
          );
        },
        openBuilder: (context, action) {
          return const FlightPageReview();
        });
  }
}
