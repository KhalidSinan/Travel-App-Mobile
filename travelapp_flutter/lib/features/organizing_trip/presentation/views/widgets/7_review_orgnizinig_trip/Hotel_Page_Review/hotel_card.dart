import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Hotel_Page_Review/stars_list_review.dart';

class HotelCardReview extends StatelessWidget {
  const HotelCardReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      // margin: const EdgeInsets.all(8),
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Themes.primary, width: 1.5),
        borderRadius: BorderRadius.circular(5),
        color: Themes.secondary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/hotel.jpg"),
              height: 150,
              width: 135,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Text(
                      "Shirogane Park Hills",
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "Korea|${3.5} Km from center",
                      style: TextStyle(fontSize: 13),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  StarsListReview(
                    stars: 3,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
