import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:travelapp_flutter/core/helpers/hotel.dart';
import 'package:travelapp_flutter/core/helpers/rooms.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/hotel_trip_card.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/room_trip_card.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';

class TripDestinationHotel extends StatefulWidget {
  const TripDestinationHotel({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  State<TripDestinationHotel> createState() => _TripDestinationHotelState();
}

class _TripDestinationHotelState extends State<TripDestinationHotel> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(FontAwesomeIcons.hotel),
            const SizedBox(width: 12),
            Text(
              'Staying at:',
              style: Styles.heading2.copyWith(color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 8),
        HotelTripCard(hotel: widget.hotel),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.hotel.roomType.length,
            itemExtent: MediaQuery.sizeOf(context).width - 50,
            itemBuilder: (context, index) {
              return RoomTripCard(
                room: widget.hotel.roomType[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
