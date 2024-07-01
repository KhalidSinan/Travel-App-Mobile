import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
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
    print(features);
    switch (feature) {
      //first
      case 'Bedding':
        return Icons.bed;
      case 'Beverages':
        return Icons.local_bar;
      case 'Spa':
        return Icons.spa;
      case 'Buffet':
        return Icons.flatware;
      case 'Shower':
        return Icons.bathtub;
      //business
      case 'Wifi':
        return Icons.wifi;
      case 'Entertainment':
        return Icons.sports_esports;
      case 'Fast Food':
        return Icons.fastfood;
      case 'Privacy':
        return Icons.safety_divider;
      case 'Lie seats':
        return Icons.airline_seat_flat;
      //economy
      case 'Drinks':
        return Icons.local_cafe;
      case 'TV':
        return Icons.live_tv;
      case 'Charging':
        return Icons.power;
      case 'Meal':
        return Icons.room_service;
      case 'Backrest':
        return Icons.airline_seat_recline_extra;
      default:
        return null;
    }
  }
}
