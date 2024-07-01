import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/hotel_rooms_page_body.dart';

class HotelRoomsPage extends StatelessWidget {
  const HotelRoomsPage({super.key, required this.bloc});
  final HotelDetailsCubit bloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: const Scaffold(
        body: SafeArea(
          child: HotelRoomsPageBody(),
        ),
      ),
    );
  }
}
