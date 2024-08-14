import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/data/models/flight_reservations_model.dart';
import 'package:travelapp_flutter/features/home/data/models/hotel_reservations_model.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/all_cards_page.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/flights_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/hotel_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/title_row.dart';

class LatestReservations extends StatefulWidget {
  const LatestReservations({super.key});

  @override
  State<LatestReservations> createState() => _LatestReservationsState();
}

class _LatestReservationsState extends State<LatestReservations> {
  List<FlightReservationsModel> flights = [];
  List<HotelReservationsModel> hotels = [];
  @override
  void initState() {
    super.initState();
    flights = BlocProvider.of<MyReservationsCubit>(context).latestFlights;
    hotels = BlocProvider.of<MyReservationsCubit>(context).latestHotels;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          title: 'Flights',
          type: 'latest',
          onPressed: () {
            if (flights.isNotEmpty) {
              Get.to(AllCardsPage(type: 'flights', flights: flights));
            }
          },
        ),
        if (flights.isNotEmpty) FlightsBox(flight: flights[flights.length - 1]),
        if (flights.isEmpty)
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "No finished reservations yet",
                style: TextStyle(color: Themes.third, fontSize: 15),
              ),
            ),
          ),
        TitleRow(
            title: 'Hotels',
            type: 'latest',
            onPressed: () {
              if (hotels.isNotEmpty) {
                Get.to(AllCardsPage(type: 'hotels', hotels: hotels));
              }
            }),
        if (hotels.isNotEmpty) HotelBox(hotel: hotels[hotels.length - 1]),
        if (hotels.isEmpty)
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "No finished reservations yet",
                style: TextStyle(color: Themes.third, fontSize: 15),
              ),
            ),
          ),
      ],
    );
  }
}
