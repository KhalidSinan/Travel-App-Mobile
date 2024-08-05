import 'package:travelapp_flutter/features/organizing_trip/data/models/airline_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/date_time_model.dart';

class Flight {
  final String id;
  final AirlineModel airline;
  final String source;
  final String srcAirport;
  final String desAirport;
  final String destination;
  final DateModel departureDate;
  final DateModel arrivalDate;
  final String duration;
  final double price;

  Flight({
    required this.id,
    required this.airline,
    required this.source,
    required this.srcAirport,
    required this.desAirport,
    required this.destination,
    required this.departureDate,
    required this.arrivalDate,
    required this.duration,
    required this.price,
  });

  factory Flight.fromJson(jsonDate) {
    return Flight(
        id: jsonDate['id'],
        airline: AirlineModel.fromJson(jsonDate['airline']),
        source: jsonDate['source']['city'],
        destination: jsonDate['destination']['city'],
        srcAirport: jsonDate['source']['airport'],
        desAirport: jsonDate['destination']['airport'],
        departureDate: DateModel.fromJson(jsonDate['departure_date']),
        arrivalDate: DateModel.fromJson(jsonDate['arrival_date']),
        duration: jsonDate['duration'],
        price: jsonDate['price']);
  }
}
