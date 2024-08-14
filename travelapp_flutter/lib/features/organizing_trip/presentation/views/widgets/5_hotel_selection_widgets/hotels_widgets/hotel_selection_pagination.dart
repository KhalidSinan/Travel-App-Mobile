import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/helpers/hotel.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservations_states.dart';

class HotelSelectionPagination extends StatelessWidget {
  const HotelSelectionPagination({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HotelReservationCubit, HotelReservationState>(
        builder: (context, state) {
          final hotelRes = BlocProvider.of<HotelReservationCubit>(context);
          return Offstage(
            offstage: hotelRes.getTotalNumberPages() <= 1,
            child: NumberPaginator(
              numberPages: hotelRes.getTotalNumberPages(),
              initialPage: 0,
              onPageChange: (index) async {
                await hotelRes.changePage(index + 1);
              },
              config: NumberPaginatorUIConfig(
                buttonSelectedBackgroundColor: Themes.primary,
                buttonUnselectedForegroundColor: Themes.third,
              ),
            ),
          );
        },
      ),
    );
  }
}
