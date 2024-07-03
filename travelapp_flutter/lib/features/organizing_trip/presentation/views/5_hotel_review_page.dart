// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/hotels_widgets/hotel_review_page_body.dart';

class HotelReviewPage extends StatelessWidget {
  const HotelReviewPage({super.key, required this.bloc});
  final HotelReservationCubit bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: const Scaffold(
        body: SafeArea(
          child: HotelReviewPageBody(),
        ),
      ),
    );
  }
}
