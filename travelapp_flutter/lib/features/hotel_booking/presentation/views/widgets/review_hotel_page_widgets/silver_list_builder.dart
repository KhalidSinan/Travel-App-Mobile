import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/review_hotel_cubit/make_hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/custom_card.dart';

// ignore: must_be_immutable
class SilverListBuilder extends StatelessWidget {
  SilverListBuilder({
    super.key,
    this.notAvailableRoom,
  });

  List<Map<String, dynamic>>? notAvailableRoom;

  @override
  Widget build(BuildContext context) {
    Map<String, bool> availableRooms =
        BlocProvider.of<MakeHotelReservationCubit>(context).availableRooms;

    notAvailableRoom.forEach(
      (room) => if(room.code != availableRooms),  
    );

    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: BlocProvider.of<MakeHotelReservationCubit>(context)
              .rooms!
              .length, (context, index) {
        return const RoomCard2();
      }),
    );
  }
}
