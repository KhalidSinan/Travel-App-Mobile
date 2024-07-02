import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/features_list.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';

class RoomCartCard extends StatelessWidget {
  const RoomCartCard({
    super.key,
    this.color,
    required this.roomCart,
    this.isNotDecreasable,
    required this.onDecreaseAmount,
  });
  final Color? color;
  final RoomCartModel roomCart;
  final bool? isNotDecreasable;
  final VoidCallback onDecreaseAmount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      decoration: getRoomCardDecoration(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomCart.room.bedOptions!,
                  style: Styles.heading.copyWith(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      roomCart.room.type!,
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
                          '${roomCart.room.sleepsCount}',
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
                          roomCart.room.bedOptionsCount.toString(),
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
                const SizedBox(height: 16),
                FeaturesList(
                  features: roomCart.room.amenities,
                  getFeatures: (feature) {
                    return null;
                  },
                ),
              ],
            ),
          ),
          (isNotDecreasable == false || isNotDecreasable == null)
              ? SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    label: '- Decrease (${roomCart.count})',
                    isFlat: true,
                    onPressed: onDecreaseAmount,
                  ),
                )
              : const SizedBox(),
          // button
        ],
      ),
    );
  }

  BoxDecoration getRoomCardDecoration() {
    return BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: color ?? Themes.primary, width: 3),
    );
  }
}
