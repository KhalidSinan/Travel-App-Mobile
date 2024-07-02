import 'package:travelapp_flutter/features/organizing_trip/data/models/flight_model.dart';

class AvailableFlightModel {
  final String city;
  final Flight? flight;
  final bool isAvailable;
  final String reason;

  AvailableFlightModel(
      {required this.city,
      required this.flight,
      required this.isAvailable,
      required this.reason});

  factory AvailableFlightModel.fromJson(jsonData) {
    return AvailableFlightModel(
        city: jsonData['city'],
        flight: jsonData['flight'],
        isAvailable: jsonData['is_available'],
        reason: jsonData['reason']);
  }
}
