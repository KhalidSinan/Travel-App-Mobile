import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';

import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/room_card.dart';


class RoomsList extends StatelessWidget {
  const RoomsList({
    super.key,
    required this.rooms,
    required this.type,
  });

  final List<RoomTypeModel> rooms;
  final String type;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        return rooms[index].type == type
            ? RoomCard(
                room: rooms[index],
                onRoomAdd: () {
                  BlocProvider.of<HotelDetailsCubit>(context).addRoom(
                      RoomCartModel.from({"room": rooms[index], "count": 1}));
                },
              )
            : const SizedBox();
      },
    );
  }
}
