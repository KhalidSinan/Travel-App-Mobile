// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/destination_hotel_details_page_body.dart';

class HotelSelectionDetailsPage extends StatelessWidget {
  const HotelSelectionDetailsPage({super.key, required this.bloc});
  final HotelReservationCubit bloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: const Scaffold(
        body: SafeArea(
          child: HotelSelectionDetailsPageBody(),
        ),
      ),
    );
  }
}
