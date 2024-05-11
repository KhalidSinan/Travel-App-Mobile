import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ReservationTicketState {}

class InitialReservationTicketState extends ReservationTicketState {}

class LoadingReservationTicketState extends ReservationTicketState {}

class SuccessReservationTicketState extends ReservationTicketState {}

class FailureReservationTicketState extends ReservationTicketState {
  final Failure failure;

  FailureReservationTicketState({required this.failure});
}

class LoadingSearchFlightState extends ReservationTicketState {}

class SuccessSearchFlightState extends ReservationTicketState {
  final List<dynamic> flights;
  final bool isTwoWay;
  final String departureDate;
  final String source;
  final String destination;
  final int seats;
  final String seatsClass;
  final String? dateEnd;
  final List<dynamic> airlines;

  SuccessSearchFlightState({
    required this.flights,
    required this.isTwoWay,
    required this.departureDate,
    required this.source,
    required this.destination,
    required this.seats,
    required this.seatsClass,
    required this.dateEnd,
    required this.airlines,
  });
}

class FailureSearchFlightState extends ReservationTicketState {
  final Failure failure;

  FailureSearchFlightState({required this.failure});
}
