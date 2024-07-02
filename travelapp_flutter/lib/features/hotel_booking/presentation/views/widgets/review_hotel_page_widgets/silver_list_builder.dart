import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/room_cart_card.dart';

class SilverListBuilder extends StatelessWidget {
  const SilverListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, bool> availableRooms =
        BlocProvider.of<HotelDetailsCubit>(context).availableRooms;

    List<bool> listOfAvailableRoom = availableRooms.values.toList();

    List<RoomCartModel>? rooms =
        BlocProvider.of<HotelDetailsCubit>(context).selectedRooms;

    return BlocBuilder<HotelDetailsCubit, HotelDetailsStates>(
        builder: (context, state) {
      return (rooms.isEmpty)
          ? const SliverFillRemaining(
              child: Center(
                child: Text('No Rooms Chosen'),
              ),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(childCount: rooms.length,
                  (context, index) {
                if (listOfAvailableRoom[index] == false) {
                  return RoomCartCard(
                    color: Colors.red,
                    roomCart: rooms[index],
                    onDecreaseAmount: () {
                      BlocProvider.of<HotelDetailsCubit>(context)
                          .removeRoom(rooms[index]);
                    },
                  );
                }
                return RoomCartCard(
                  roomCart: rooms[index],
                  onDecreaseAmount: () {
                    BlocProvider.of<HotelDetailsCubit>(context)
                        .removeRoom(rooms[index]);
                  },
                );
              }),
            );
    });
  }
}
