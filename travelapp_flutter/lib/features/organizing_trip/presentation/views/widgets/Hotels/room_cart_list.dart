import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/room_cart_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservations_states.dart';

class RoomCartList extends StatelessWidget {
  const RoomCartList({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelRes = BlocProvider.of<HotelReservationCubit>(context);
    final selectedRooms = hotelRes.selectedRooms;
    final availableRooms = hotelRes.availableRooms;
    return BlocBuilder<HotelReservationCubit, HotelReservationState>(
      builder: (context, state) {
        if (selectedRooms.isEmpty) {
          return SliverFillRemaining(
              child: Center(
                  child: Text(
            'No Rooms Selected',
            style: Styles.content.copyWith(color: Colors.grey),
          )));
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: selectedRooms.length,
            (context, index) {
              if (!availableRooms[selectedRooms[index].room.code]) {
                return RoomCartCard(
                  color: Colors.red,
                  roomCart: selectedRooms[index],
                  onDecreaseAmount: () {
                    hotelRes.removeRoom(selectedRooms[index]);
                  },
                );
              }
              return RoomCartCard(
                roomCart: selectedRooms[index],
                onDecreaseAmount: () {
                  hotelRes.removeRoom(selectedRooms[index]);
                },
              );
            },
          ),
        );
      },
    );
  }
}
