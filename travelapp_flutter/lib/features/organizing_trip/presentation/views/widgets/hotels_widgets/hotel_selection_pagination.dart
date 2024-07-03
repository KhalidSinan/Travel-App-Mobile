import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';

class HotelSelectionPagination extends StatelessWidget {
  const HotelSelectionPagination({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelRes = BlocProvider.of<HotelReservationCubit>(context);
    return SliverToBoxAdapter(
      child: NumberPaginator(
        numberPages: getNumberOfPages(hotelRes),
        initialPage: 1,
        onPageChange: (index) async {
          await hotelRes.changePage(index);
        },
        config: NumberPaginatorUIConfig(
          buttonSelectedBackgroundColor: Themes.primary,
          buttonUnselectedForegroundColor: Themes.third,
        ),
      ),
    );
  }

  int getNumberOfPages(HotelReservationCubit hotelRes) =>
      (hotelRes.hotels!.hotels.length / flightsInSinglePage).ceil();
}
