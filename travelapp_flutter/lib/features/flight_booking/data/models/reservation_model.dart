import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/remaining_time_model.dart';

class ReservationModel {
  final OneWayFlightModel flight;
  final int? seat;
  final bool reservationType;
  final double overallPrice;
  final OneWayFlightModel? flightBack;
  final RemainingTimeModel remainingTime;

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
  }
}
