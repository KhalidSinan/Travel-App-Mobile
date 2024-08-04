// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/rooms_selection_page_body.dart';

class RoomsSelectionPage extends StatelessWidget {
  const RoomsSelectionPage({
    super.key,
    required this.bloc,
    required this.bloc2,
  });
  final HotelReservationCubit bloc;
  final HotelInformationCubit bloc2;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        BlocProvider.value(value: bloc2),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: RoomsSelectionPageBody(),
        ),
      ),
    );
  }
}
