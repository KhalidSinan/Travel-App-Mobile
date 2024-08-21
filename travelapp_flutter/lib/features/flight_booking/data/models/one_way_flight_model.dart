import 'package:travelapp_flutter/features/flight_booking/data/models/airline_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/country_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/trip_date_model.dart';

class OneWayFlightModel {
  final String? id;
  final AirlineModel airline;
  final CountryModel source;
  final CountryModel destination;
  final DateInfo departure;
  final DateInfo arrival;
  final String duration;
  final List<PassengerModel>? reservations;
  final String flightPrice;
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

  factory OneWayFlightModel.fromJson(jsonData) {
    print(jsonData);
    List<PassengerModel>? reservations;
    if (jsonData['reservations'] != null) {
      reservations = [];
      for (int i = 0; i < jsonData['reservations'].length; i++) {
        reservations.add(PassengerModel.fromJson(jsonData['reservations'][i]));
        print(reservations[i]);
      }
    }
    return OneWayFlightModel(
      id: jsonData['id'],
      airline: AirlineModel.fromJson(jsonData['airline']),
      source: CountryModel.fromJson(jsonData['source']),
      destination: CountryModel.fromJson(jsonData['destination']),
      departure: DateInfo.fromJson(jsonData['departure_date']),
      arrival: DateInfo.fromJson(jsonData['arrival_date']),
      duration: jsonData['duration'].toString(),
      reservations: reservations,
      flightPrice:
          jsonData['price'].toString() ?? jsonData['flight_price'].toString(),
    );
  }
}









  // factory TicketModel.fromJson(jsonData) {
  //   return TicketModel(
  //       airline: jsonData["reservation"]['flight']['airline'],
  //       name: jsonData["reservation"]['flight']['source']['name'],
  //       city: jsonData["reservation"]['flight']['city'],
  //       country: jsonData["reservation"]['flight']['country'],
  //       date: jsonData["reservation"]['flight']['destination'],
  //       time: jsonData["reservation"]['flight'],
  //       duration: jsonData["reservation"]['flight'],
  //       reservations: jsonData["reservation"]['flight'],
  //       numberOfReservation: jsonData["reservation"]['flight'],
  //       reservationType: jsonData["reservation"]['flight'],
  //       boolReservationType: jsonData["reservation"]['flight']);
  // }