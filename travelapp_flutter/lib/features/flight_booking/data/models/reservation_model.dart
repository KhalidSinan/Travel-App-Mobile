import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/remaining_time_model.dart';

class ReservationModel {
<<<<<<< HEAD
  final OneWayFlightModel flight;
  final int? seat;
  final bool reservationType;
  final double overallPrice;
  final OneWayFlightModel? flightBack;
  final RemainingTimeModel remainingTime;

<<<<<<< HEAD
  ReservationModel(
      {required this.flight,
      required this.seat,
      required this.reservationType,
      required this.overallPrice,
      required this.flightBack});
=======
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
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338
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
=======
  ReservationModel({
    required this.flight,
    required this.seat,
    required this.reservationType,
    required this.overallPrice,
    required this.flightBack,
    required this.remainingTime,
  });
  factory ReservationModel.fromJson(jsonData) {
    return ReservationModel(
      flight: OneWayFlightModel.fromJson(jsonData['flight']),
      seat: jsonData['num_of_reservations'],
      reservationType: jsonData['two_way'],
      overallPrice: jsonData['overall_price'],
      flightBack: jsonData['flight_back'] != null
          ? OneWayFlightModel.fromJson(jsonData['flight_back'])
          : null,
      remainingTime: RemainingTimeModel.fromJson(jsonData['remaining_time']),
    );
>>>>>>> Khalid
  }
}
