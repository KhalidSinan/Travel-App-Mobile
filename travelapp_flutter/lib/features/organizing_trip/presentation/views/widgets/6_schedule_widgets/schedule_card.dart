import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key, required this.place});
 final PlaceModel place;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
      width: 240,
      decoration: BoxDecoration(
        color: Themes.secondary,
        border: Border.symmetric(
          vertical: BorderSide(color: Themes.primary, width: 0.8),
          horizontal: BorderSide(color: Themes.primary, width: 0.8),
        ),
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            place.name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.call,
                color: Themes.third,
              ),
              const SizedBox(width: 6),
             Text(
                 '+${place.phoneNumber.countryCode} ${place.phoneNumber.number}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
