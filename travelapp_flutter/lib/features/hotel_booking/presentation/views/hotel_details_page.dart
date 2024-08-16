import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/hotel_details_page_body.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({
    super.key,
    required this.hotel,
    required this.startDate,
    required this.numDays,
  });
  final HotelModel hotel;
  final String? startDate;
  final int? numDays;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelDetailsCubit(
        hotel,
        hotel.roomType,
        startDate,
        numDays == null ? '1' : numDays.toString(),
        getIt.get<HotelBookingImp>(),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: HotelDetailsPageBody(),
        ),
      ),
    );
  }
}
