import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Flight_Page_Review/card_ticket.dart';

class FlightReviewBody extends StatelessWidget {
  const FlightReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Themes.primary,
        ),
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: CardTicketFlightReview(),
        ),
      ),
    );
  }
}
