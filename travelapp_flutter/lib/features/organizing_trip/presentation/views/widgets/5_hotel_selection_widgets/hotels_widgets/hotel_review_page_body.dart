import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_for_destination_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservations_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/room_cart_list.dart';

class HotelReviewPageBody extends StatelessWidget {
  const HotelReviewPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelRes = BlocProvider.of<HotelReservationCubit>(context);
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: const CustomBackButton(),
                title: Text(
                  'Review Rooms',
                  style: Styles.heading2,
                ),
              ),
              const RoomCartList(),
            ],
          ),
        ),
        BlocBuilder<HotelReservationCubit, HotelReservationState>(
          builder: (context, state) => SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {
                final hotel = hotelRes.currentHotel;
                HotelForDestinationModel chosenHotel = HotelForDestinationModel(
                  destination: hotelRes.city,
                  hotelName: hotel!.name,
                  hotelId: hotel.id,
                  rooms: hotelRes.selectedRooms,
                  startDate: hotelRes.startDate,
                  numDays: hotelRes.numDays,
                  totalPrice: hotelRes.getTotalPrice(),
                );
              },
              label: 'Done (\$${hotelRes.getTotalPrice()})',
              isFlat: true,
            ),
          ),
        )
      ],
    );
  }
}
