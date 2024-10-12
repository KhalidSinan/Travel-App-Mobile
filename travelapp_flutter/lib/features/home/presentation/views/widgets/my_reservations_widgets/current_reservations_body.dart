import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/data/models/flight_reservations_model.dart';
import 'package:travelapp_flutter/features/home/data/models/hotel_reservations_model.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/flights_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/hotel_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/title_row.dart';

class CurrentReservations extends StatefulWidget {
  const CurrentReservations({super.key});

  @override
  State<CurrentReservations> createState() => _CurrentReservationsState();
}

class _CurrentReservationsState extends State<CurrentReservations> {
  List<FlightReservationsModel> flights = [];
  List<HotelReservationsModel> hotels = [];
  @override
  void initState() {
    super.initState();
    flights = BlocProvider.of<MyReservationsCubit>(context).currentFlights;
    hotels = BlocProvider.of<MyReservationsCubit>(context).currentHotels;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, builder) {
          return Column(
            children: [
              const TitleRow(title: 'Flights', type: 'current'),
              SizedBox(
                height: 200,
                child: flights.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return FlightsBox(flight: flights[index]);
                        },
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            'No current flight reservations',
                            style: TextStyle(color: Themes.third, fontSize: 15),
                          ),
                        ),
                      ),
              ),
              const TitleRow(title: 'Hotels', type: 'current'),
              SizedBox(
                height: hotels.isNotEmpty ? hotels.length * 190 : 200,
                child: hotels.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: hotels.length,
                        itemBuilder: (context, index) {
                          return HotelBox(hotel: hotels[index]);
                        },
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            'No current hotel reservations',
                            style: TextStyle(color: Themes.third, fontSize: 15),
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
