import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.name,
    required this.description,
    required this.location,
    required this.number,
    required this.code,
    required this.country,
    required this.city,
  });
  final String name, description, location, number, code, country, city;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
      width: MediaQuery.of(context).size.width,
      decoration:
          // BoxDecoration(
          //   color: Colors.white,
          //   border: BorderDirectional(
          //     bottom: BorderSide(color: Themes.primary, width: 2),
          //   ),
          // ),
          BoxDecoration(
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
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 23),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Themes.third,
              ),
              const SizedBox(width: 6),
              Text(
                location,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
            ],
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
                '+$code $number',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
