// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/hotel_review_page_body.dart';

class HotelReviewPage extends StatelessWidget {
  const HotelReviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HotelReviewPageBody(),
      ),
    );
  }
}
