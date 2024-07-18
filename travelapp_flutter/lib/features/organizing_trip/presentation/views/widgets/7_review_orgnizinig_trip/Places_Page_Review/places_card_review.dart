import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class PlaceCardReview extends StatelessWidget {
  const PlaceCardReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Themes.secondary,
        border: Border.symmetric(
          vertical: BorderSide(color: Themes.primary, width: 3),
          horizontal: BorderSide(color: Themes.primary, width: 0.8),
        ),
        borderRadius: BorderRadiusDirectional.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Romeo's Pizzeria",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 23),
          ),
          const SizedBox(height: 8),
          const Text(
            "Description for Places",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Themes.third,
              ),
              const SizedBox(width: 6),
              const Text(
                "20481 N 7th Street",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.call,
                    color: Themes.third,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    '+${963} ${9999994560}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Text(
                "Day 1",
                style: TextStyle(color: Themes.third, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
