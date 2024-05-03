import 'package:travelapp_flutter/features/flight_booking/data/models/country_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passengers_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/trip_date_model.dart';

class FlightModel {
  final String airline;
  final CountryModel source;
  final CountryModel destination;
  final DateInfo departure;
  final DateInfo arrival;
  final String duration;
  final List<PassengerModel>? reservations;
  final double flightPrice;
  FlightModel(
      {required this.airline,
      required this.source,
      required this.destination,
      required this.departure,
      required this.arrival,
      required this.duration,
      required this.reservations,
      required this.flightPrice});

  factory FlightModel.fromJson(jsonData) {
    List<PassengerModel>? reservations;
    if (jsonData['reservations'] != null) {
      reservations = [];
      for (int i = 0; i < jsonData['reservations'].length; i++) {
        reservations.add(PassengerModel.fromJson(jsonData['reservations'][i]));
        print(reservations[i]);
      }
    }
    return FlightModel(
        airline: jsonData['airline'],
        source: CountryModel.fromJson(jsonData['source']),
        destination: CountryModel.fromJson(jsonData['destination']),
        departure: DateInfo.fromJson(jsonData['departure_date']),
        arrival: DateInfo.fromJson(jsonData['arrival_date']),
        duration: jsonData['duration'],
        reservations: reservations,
        flightPrice: jsonData['flight_price']);
  }
}
