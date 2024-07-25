import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Places_Page_Review/places_review_body.dart';

class PlacesPageReview extends StatelessWidget {
  const PlacesPageReview({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(290),
          child: Container(
            padding: const EdgeInsets.all(33),
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
                  "Informations About Your Selected Places",
                  style: TextStyle(
                      color: Themes.third,
                      fontWeight: FontWeight.w200,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Total journey Number Activity : ${5}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 16,
                ),
                
              ],
            ),
          )),
      body: const PlacesReviewBody() ,
    );
  }
}