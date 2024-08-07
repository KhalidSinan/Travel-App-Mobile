// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/destination_hotels_page_body.dart';

class DestinationHotelsPage extends StatelessWidget {
  const DestinationHotelsPage({
    super.key,
    required this.city,
    required this.startDate,
    required this.numDays,
    required this.numRooms,
    required this.bloc,
  });
  final String city, startDate;
  final int numDays, numRooms;
  final HotelInformationCubit bloc;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HotelReservationCubit(
            getIt.get<HotelBookingImp>(),
            city: city,
            startDate: startDate,
            numDays: numDays,
            numRooms: numRooms,
          )..getAllHotels(),
        ),
        BlocProvider.value(
          value: bloc,
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: DestinationHotelsPageBody(),
        ),
      ),
    );
  }
}
