import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';

class TwoWayFlightModel {
  final OneWayFlightModel flight;
  final OneWayFlightModel flightBack;
  final String overallPrice;

  TwoWayFlightModel({
    required this.flight,
    required this.flightBack,
    required this.overallPrice,
  });

  factory TwoWayFlightModel.fromJson(jsonData) {
    print(jsonData['flight']);
    print(jsonData['flight_back']);
    return TwoWayFlightModel(
      flight: OneWayFlightModel.fromJson(jsonData['flight']),
      flightBack: OneWayFlightModel.fromJson(jsonData['flight_back']),
      overallPrice: jsonData['overall_price'],
    );
  }
}
