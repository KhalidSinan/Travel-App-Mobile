import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class HotelsPagination extends StatelessWidget {
  const HotelsPagination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllHotelsCubit, AllHotelStates>(
      builder: (context, state) {
        if (state is SuccessAllHotelStates) {
          //  int totalHotels =
          //     BlocProvider.of<AllHotelsCubit>(context).totalHotels;
          // int numberPages = (totalHotels / flightsInSinglePage).ceil();
          // if (numberPages <= 1) {
          //   return const SliverToBoxAdapter(
          //     child: SizedBox(),
          //   );
          // }
        }
        return SliverToBoxAdapter(
          child: NumberPaginator(
            numberPages:1 ,
            initialPage: 1,
            // onPageChange: (index) async {
            //   await BlocProvider.of<AllFlightsCubit>(context).changePage(index + 1);
            // },
            config: NumberPaginatorUIConfig(
              buttonSelectedBackgroundColor: Themes.primary,
              buttonUnselectedForegroundColor: Themes.third,
            ),
          ),
        );
      },
    );
  }
}
