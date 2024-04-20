
abstract class ConfirmFlightReservationState {}

class InitialConfirmFlightReservationState
    extends ConfirmFlightReservationState {}

class SuccessConfirmFlightReservationState
    extends ConfirmFlightReservationState {}

class LoadingConfirmFlightReservationState
    extends ConfirmFlightReservationState {}

class FailureConfirmFlightReservationState
    extends ConfirmFlightReservationState {
  final String errMessage;
  final String? errTitle;

  FailureConfirmFlightReservationState(
      {required this.errMessage, required this.errTitle});
}
