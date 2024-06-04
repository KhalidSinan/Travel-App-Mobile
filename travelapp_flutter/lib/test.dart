import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllHotelsCubit(getIt.get<HotelBookingImp>())
        ..getAllHotelData(
          nameHotelOrCity: 'Berlin',
        ),
      child: BlocBuilder<AllHotelsCubit, AllHotelStates>(
        builder: (context, state) {
          List<String> images = BlocProvider.of<AllHotelsCubit>(context)
              .allhotels!
              .hotels[0]
              .images;
          return Scaffold(
            body: ListView.builder(
              itemBuilder: (context, index) {
                return Image.asset(images[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
