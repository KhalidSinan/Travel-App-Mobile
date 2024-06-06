import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/widgets/custom_tag.dart';
import 'package:travelapp_flutter/core/widgets/features_list.dart';

class ClassCard extends StatelessWidget {
  const ClassCard(
      {super.key,
      required this.classType,
      required this.load,
      required this.features});
  final String classType;
  final int load;
  final List<String>? features;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Themes.primary,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                classType,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Text(
                'Load : $load kg',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Themes.third,
                  size: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Features',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FeaturesList(
            features: features,
            getFeatures: getFeatureIcon,
          ),
        ],
      ),
    );
  }

  IconData? getFeatureIcon(String feature) {
    switch (feature) {
      case 'Buffet':
        return Icons.restaurant;
      case 'Bedding':
        return Icons.bed;
      case 'Beverages':
        return Icons.local_bar;
      case 'Comfort':
        return Icons.event_seat;
      case 'Toiletries':
        return Icons.bathtub;
      case 'Wifi':
        return FontAwesomeIcons.rss;
      case 'Lie seats':
        return Icons.airline_seat_flat;
      case 'Entertainment':
        return FontAwesomeIcons.gamepad;
      case 'Suite':
        return Icons.weekend;
      case 'Pajamas':
        return FontAwesomeIcons.shirt;
      case 'Drinks':
        return Icons.local_cafe;
      case 'TV':
        return Icons.tv;
      case 'Charging':
        return Icons.power;
      case 'Meal':
        return Icons.room_service;
      default:
        return null;
    }
  }
}
