import 'package:travelapp_flutter/features/flight_booking/data/models/flight_model.dart';

class ReservationModel {
  final FlightModel flight;
  final int? seat;
  final bool isTwoWay;
  final double overallPrice;
  final FlightModel? flightBack;
  final int hours;
  final int days;
  final int minutes;
  final int seconds;
  ReservationModel({
    required this.flight,
    required this.seat,
    required this.isTwoWay,
    required this.overallPrice,
    required this.flightBack,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });
  factory ReservationModel.fromJson(jsonData) {
    return ReservationModel(
        flight: FlightModel.fromJson(jsonData['flight']),
        seat: jsonData['num_of_reservations'],
        isTwoWay: jsonData['two_way'],
        overallPrice: jsonData['overall_price'],
        flightBack: FlightModel.fromJson(jsonData['flight_back']),
        days: jsonData['remaining_time']['days'],
        hours: jsonData['remaining_time']['hours'],
        minutes: jsonData['remaining_time']['minutes'],
        seconds: jsonData['remaining_time']['seconds']);
  }
}
