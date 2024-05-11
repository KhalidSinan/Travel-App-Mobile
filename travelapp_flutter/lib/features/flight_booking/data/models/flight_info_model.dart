import 'package:travelapp_flutter/features/flight_booking/data/models/airline_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/class_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/country_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/trip_date_model.dart';

class FlightInfoModel {
  final String id;
  final AirlineModel airline;
  final CountryModel source;
  final CountryModel destination;
  final DateInfo departure;
  final DateInfo arrival;
  final String duration;
  final ClassModel classType;

  FlightInfoModel({
    required this.id,
    required this.airline,
    required this.source,
    required this.destination,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.classType,
  });

  factory FlightInfoModel.fromJson(jsonData) {
    return FlightInfoModel(
      id: jsonData['id'],
      airline: AirlineModel.fromJson(jsonData['airline']),
      source: CountryModel.fromJson(jsonData['source']),
      destination: CountryModel.fromJson(jsonData['destination']),
      departure: DateInfo.fromJson(jsonData['departure_date']),
      arrival: DateInfo.fromJson(jsonData['arrival_date']),
      duration: jsonData['duration'],
      classType: ClassModel.fromJson(jsonData['class']),
    );
  }
}
