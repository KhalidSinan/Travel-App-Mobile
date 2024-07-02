import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/room_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';

class RoomsSelectionList extends StatelessWidget {
  const RoomsSelectionList(
      {super.key, required this.rooms, required this.type});
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
                  BlocProvider.of<HotelReservationCubit>(context).addRoom(
                      RoomCartModel.from({"room": rooms[index], "count": 1}));
                },
              )
            : const SizedBox();
      },
    );
  }
}
