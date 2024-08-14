import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/hotel_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/destination_hotel_details_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/hotel_information_page.dart';

class HotelSelectionList extends StatelessWidget {
  const HotelSelectionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverList.builder(
        itemCount: BlocProvider.of<HotelReservationCubit>(context)
            .hotels!
            .hotels
            .length,
        itemBuilder: (context, index) {
          return HotelCard(
            onTap: () {
              final hotelRes = BlocProvider.of<HotelReservationCubit>(context);
              hotelRes.currentHotel = hotelRes.hotels!.hotels[index];
              Get.to(
                () => HotelInformationPage(
                  bloc: hotelRes,
                  bloc2: BlocProvider.of<HotelInformationCubit>(context),
                ),
              );
            },
            hotel: BlocProvider.of<HotelReservationCubit>(context)
                .hotels!
                .hotels[index],
          );
        },
      ),
    );
  }
}
