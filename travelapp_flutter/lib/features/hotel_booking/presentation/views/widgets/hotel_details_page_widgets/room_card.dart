import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/features_list.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.room, required this.onRoomAdd});
  final RoomTypeModel room;
  final VoidCallback onRoomAdd;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: getRoomCardDecoration(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.bedOptions!,
                  style: Styles.heading.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      room.type!,
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
                          '${room.sleepsCount}',
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
                          room.bedOptionsCount.toString(),
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
                const SizedBox(height: 5),
                Text(
                  room.view!,
                  style: Styles.content.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 16),
                FeaturesList(
                  roomTag: true,
                  features: room.amenities,
                  getFeatures: getFeatureIcon,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: '+ Add \$${room.price}',
              isFlat: true,
              onPressed: onRoomAdd,
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
