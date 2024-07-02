import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/review_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/room_types_list.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/rooms_list.dart';



class HotelRoomsPageBody extends StatelessWidget {
  const HotelRoomsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final hotel = BlocProvider.of<HotelDetailsCubit>(context).hotel;
    final rooms = BlocProvider.of<HotelDetailsCubit>(context).rooms;

    final selectedRooms =
        BlocProvider.of<HotelDetailsCubit>(context).selectedRooms;
    // final selectedRooms = 
    //     BlocProvider.of<HotelDetailsCubit>(context).selectedRooms;

    // final selectedRooms = 
    //     BlocProvider.of<HotelDetailsCubit>(context).selectedRooms;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.meeting_room,
                      color: Colors.grey[600],
                      size: 32,
                    ),
                    onPressed: () {
                      Get.to(
                        () => ReviewPage(
                          bloc: BlocProvider.of<HotelDetailsCubit>(context),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<HotelDetailsCubit, HotelDetailsStates>(
                    builder: (context, state) => Text(
                      ': ${BlocProvider.of<HotelDetailsCubit>(context).getTotalRooms()}',
                      style: Styles.content.copyWith(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            )
          ],
          leading: const CustomBackButton(),
          pinned: true,
          title: Text(
            '${hotel.name} Rooms',
            style: Styles.heading.copyWith(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: RoomTypesList(),
        ),
        BlocBuilder<HotelDetailsCubit, HotelDetailsStates>(
          builder: (context, state) => RoomsList(
            rooms: rooms,
            type: getRoomTypeById(
              BlocProvider.of<HotelDetailsCubit>(context).selectedRoomType,
            ),
          ),
        ),
      ],
    );
  }

  String getRoomTypeById(int roomTypeId) {
    print(roomTypeId);
    switch (roomTypeId) {
      case 0:
        return 'Budget';
      case 1:
        return 'Standard';
      case 2:
        return 'Deluxe';
      case 3:
        return 'Suite';
      default:
        return 'Budget';
    }
  }
}
