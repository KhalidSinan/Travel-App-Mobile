import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_body.dart';

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key, required this.hotel});
  final HotelModel hotel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelDetailsCubit(hotel),
      child: const Scaffold(
        body: SafeArea(
          child: HotelDetailsPageBody(),
        ),
      ),
    );
  }
}
