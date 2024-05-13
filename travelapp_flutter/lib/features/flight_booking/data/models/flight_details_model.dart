import 'package:travelapp_flutter/features/flight_booking/data/models/flight_info_model.dart';

class FlightDetailsModel {
  final bool twoWay;
  final FlightInfoModel flight;
  final FlightInfoModel? flightback;

  FlightDetailsModel({
    required this.flight,
    this.flightback,
    required this.twoWay,
  });

  factory FlightDetailsModel.fromJson(jsonData) {
    print(jsonData);
    return FlightDetailsModel(
      twoWay: jsonData['two_way'],
      flight: FlightInfoModel.fromJson(jsonData['data']['flight']),
      flightback: jsonData['data']['flight_back'] == null
          ? null
          : FlightInfoModel.fromJson(jsonData['data']['flight_back']),
    );
  }
}
