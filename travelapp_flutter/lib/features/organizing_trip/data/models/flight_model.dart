import 'dart:ffi';
import 'package:travelapp_flutter/features/organizing_trip/data/models/airline_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/date_time_model.dart';

class Flight {
  final String id;
  final AirlineModel airline;
  final String source;
  final String destination;
  final Date departureDate;
  final Date arrivalDate;
  final String duration;
  final Double price;

  Flight(
      {required this.id,
      required this.airline,
      required this.source,
      required this.destination,
      required this.departureDate,
      required this.arrivalDate,
      required this.duration,
      required this.price});

  factory Flight.fromJson(jsonDate) {
    return Flight(
        id: jsonDate['id'],
        airline: jsonDate['airline'],
        source: jsonDate['source']['city'],
        destination: jsonDate['destination']['city'],
        departureDate: jsonDate['departure_date'],
        arrivalDate: jsonDate['arrival_date'],
        duration: jsonDate['duration'],
        price: jsonDate['price']);
  }
}
