import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservations_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/5_hotel_review_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/hotels_widgets/rooms_selection_list.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/hotels_widgets/rooms_selection_types_list.dart';

class RoomsSelectionPageBody extends StatelessWidget {
  const RoomsSelectionPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    final hotelRes = BlocProvider.of<HotelReservationCubit>(context);
    final rooms = hotelRes.currentHotel!.roomType;
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
                        () => HotelReviewPage(bloc: hotelRes),
                      );
                    },
                  ),
                  BlocBuilder<HotelReservationCubit, HotelReservationState>(
                    builder: (context, state) => Text(
                      ': ${BlocProvider.of<HotelReservationCubit>(context).getTotalRooms()}',
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
            hotelRes.currentHotel!.name,
            style: Styles.heading.copyWith(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: RoomsSelectionTypesList(),
        ),
        BlocBuilder<HotelReservationCubit, HotelReservationState>(
          builder: (context, state) => RoomsSelectionList(
            rooms: rooms,
            type: BlocProvider.of<HotelReservationCubit>(context)
                .selectedRoomType,
          ),
        ),
      ],
    );
  }
}
