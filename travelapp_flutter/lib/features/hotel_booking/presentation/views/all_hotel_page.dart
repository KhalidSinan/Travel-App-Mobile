import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_hotels_page_widgets/all_hotels_page_body.dart';

class AllHotelsPage extends StatelessWidget {
  const AllHotelsPage({
    super.key,
    this.nameHotelOrCity,
    this.startDate,
    this.numDays,
    this.numRooms,
  });

  final String? nameHotelOrCity;
  final String? startDate;
  final int? numDays, numRooms;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AllHotelsCubit, AllHotelStates>(
          listener: (context, state) {
            if (state is FailureGetAllHotelsState) {
              Get.to(
                () => FailurePage(
                  error: state.failure,
                  onPressed: () async {
                    await BlocProvider.of<AllHotelsCubit>(context).retry();
                  },
                ),
              );
            }
          },
          child: AllHotelsPageBody(
              city: BlocProvider.of<AllHotelsCubit>(context)
                  .namecityOrhotelName!),
        ),
      ),
    );
  }
}
