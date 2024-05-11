import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ConfirmFlightReservationState {}

class InitialConfirmFlightReservationState
    extends ConfirmFlightReservationState {}

class SuccessConfirmFlightReservationState
    extends ConfirmFlightReservationState {}

class LoadingConfirmFlightReservationState
    extends ConfirmFlightReservationState {}

class FailureConfirmFlightReservationState
    extends ConfirmFlightReservationState {
  final Failure failure;
  FailureConfirmFlightReservationState({required this.failure});
}
