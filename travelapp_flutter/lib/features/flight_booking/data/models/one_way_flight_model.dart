import 'package:travelapp_flutter/features/flight_booking/data/models/airline_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/country_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passengers_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/trip_date_model.dart';

class OneWayFlightModel {
  final String id;
  final AirlineModel airline;
  final CountryModel source;
  final CountryModel destination;
  final DateInfo departure;
  final DateInfo arrival;
  final String duration;
  final List<PassengerModel>? reservations;
  final double flightPrice;
  OneWayFlightModel({
    required this.id,
    required this.airline,
    required this.source,
    required this.destination,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.reservations,
    required this.flightPrice,
  });

<<<<<<< HEAD:travelapp_flutter/lib/features/flight_booking/data/models/one_way_flight_model.dart
  factory OneWayFlightModel.fromJson(jsonData) {
    return OneWayFlightModel(
        id: jsonData['id'],
        airline: AirlineModel.fromJson(jsonData['airline']),
=======
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
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338:travelapp_flutter/lib/features/flight_booking/data/models/flight_model.dart
        source: CountryModel.fromJson(jsonData['source']),
        destination: CountryModel.fromJson(jsonData['destination']),
        departure: DateInfo.fromJson(jsonData['departure_date']),
        arrival: DateInfo.fromJson(jsonData['arrival_date']),
        duration: jsonData['duration'],
<<<<<<< HEAD:travelapp_flutter/lib/features/flight_booking/data/models/one_way_flight_model.dart
        reservations: jsonData['reservations'] != null
            ? PassengersModel.fromJson(jsonData['reservations'])
            : null,
        flightPrice: jsonData['price']);
=======
        reservations: reservations,
        flightPrice: jsonData['flight_price']);
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338:travelapp_flutter/lib/features/flight_booking/data/models/flight_model.dart
  }
}
