import 'package:travelapp_flutter/features/flight_booking/data/models/flight_model.dart';

class ReservationModel {
  final FlightModel flight;
  final int ?seat;
  final bool reservationType;
  final double overallPrice;
  final FlightModel? flightBack;

  ReservationModel(
      {required this.flight,
      required this.seat,
      required this.reservationType,
      required this.overallPrice,
      required this.flightBack});
  factory ReservationModel.fromJson(jsonData) {
    return ReservationModel(
        flight: jsonData['reservation']['flight'],
        seat: jsonData['reservation']['num_of_reservations'],
        reservationType: jsonData['reservation']['two_way'],
        overallPrice: jsonData['reservation']['overall_price'],
        flightBack: jsonData['reservation']['flight_back']);
  }
}
