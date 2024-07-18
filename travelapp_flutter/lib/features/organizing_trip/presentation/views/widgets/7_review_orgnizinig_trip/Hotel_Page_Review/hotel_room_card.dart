import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/features_list.dart';

class RoomCardReview extends StatelessWidget {
  const RoomCardReview({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      decoration: getRoomCardDecoration(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Double Bed",
                  style: Styles.heading.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Budget",
                      style: Styles.content.copyWith(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.users,
                          color: Colors.grey[600],
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${3}',
                          style: TextStyle(
                            color: Themes.third,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          FontAwesomeIcons.bed,
                          color: Colors.grey[600],
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "2",
                          style: TextStyle(
                            color: Themes.third,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "City View",
                  style: Styles.content.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 16),
                FeaturesList(
                  roomTag: true,
                  features: const ["Free WiFi"],
                  getFeatures: getFeatureIcon,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration getRoomCardDecoration() {
    return BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: Themes.primary, width: 3),
    );
  }

  IconData? getFeatureIcon(String feature) {
    switch (feature) {
      case 'Mini Bar':
        return Icons.local_bar;
      case 'Free WiFi':
        return Icons.wifi;
      case 'TV':
        return Icons.live_tv;
      case 'Room Service':
        return Icons.room_service;
      default:
        return null;
    }
  }
}
