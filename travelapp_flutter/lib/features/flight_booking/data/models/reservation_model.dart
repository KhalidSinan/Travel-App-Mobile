import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';

class ReservationModel {
  final OneWayFlightModel flight;
  final int? seat;
  final bool reservationType;
  final double overallPrice;
  final OneWayFlightModel? flightBack;

  ReservationModel(
      {required this.flight,
      required this.seat,
      required this.reservationType,
      required this.overallPrice,
      required this.flightBack});
  factory ReservationModel.fromJson(jsonData) {
    return ReservationModel(
        flight: jsonData['flight'],
        seat: jsonData['num_of_reservations'],
        reservationType: jsonData['two_way'],
        overallPrice: jsonData['overall_price'],
        flightBack: jsonData['flight_back']);
  }
}
