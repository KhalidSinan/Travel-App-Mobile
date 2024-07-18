import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Hotel_Page_Review/hotel_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Hotel_Page_Review/hotel_room_card.dart';

class HotelReviewBody extends StatelessWidget {
  const HotelReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Themes.primary,
      ),
      itemCount: 5,
      itemBuilder: (context, index) => ExpansionTile(
        title: const HotelCardReview(),
        children: [
          SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) => const RoomCardReview()),
          )
        ],
      ),
    );
  }
}
