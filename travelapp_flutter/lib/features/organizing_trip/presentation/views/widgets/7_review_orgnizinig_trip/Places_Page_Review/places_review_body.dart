import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Places_Page_Review/places_card_review.dart';

class PlacesReviewBody extends StatelessWidget {
  const PlacesReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Themes.primary,
        ),
        itemCount: 5,
        itemBuilder: (context, index) => ExpansionTile(
          title: const Text(
            "Destination 1: Korea",
            style: TextStyle(fontSize: 18),
          ),
          children: [
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) => const PlaceCardReview(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
