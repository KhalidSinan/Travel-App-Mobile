import 'package:flutter/material.dart';
import 'package:text_marquee/text_marquee.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';

class PlaceCardReview extends StatelessWidget {
  const PlaceCardReview({
    super.key,
    required this.place,
  });

  final PlaceModel place;

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
          Text(
            place.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 23),
          ),
          const SizedBox(height: 8),
          TextMarquee(
            place.description,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
            spaceSize: 40,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Themes.third,
              ),
              // const SizedBox(width: 6),
              Expanded(
                child: Text(
                  "${place.address.city} ${place.address.country} ${place.address.address}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18),
                ),
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
                  Text(
                    '+${place.phoneNumber.countryCode} ${place.phoneNumber.number}',
                    style: const TextStyle(fontSize: 18),
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
