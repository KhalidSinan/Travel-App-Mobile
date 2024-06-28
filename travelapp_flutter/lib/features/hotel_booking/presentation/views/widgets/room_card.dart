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
  const RoomCard({super.key, required this.room});
  final RoomTypeModel room;
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
                  room.bedOptions!,
                  style: Styles.heading.copyWith(fontSize: 20),
                ),
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
                          '2',
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
                const SizedBox(height: 4),
                Text(
                  room.view!,
                  style: Styles.content.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 16),
                FeaturesList(
                  features: room.amenities,
                  getFeatures: (feature) {
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: '+ Add \$${room.price}',
              isFlat: true,
              onPressed: () {
                BlocProvider.of<HotelDetailsCubit>(context)
                    .addRoom(RoomCartModel.from({"room": room, "count": 1}));
              },
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
}
