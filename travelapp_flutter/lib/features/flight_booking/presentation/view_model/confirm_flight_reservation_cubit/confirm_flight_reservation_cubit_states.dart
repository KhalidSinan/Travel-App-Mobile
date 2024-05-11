import 'package:travelapp_flutter/core/helpers/failure.dart';

import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ConfirmFlightReservationState {}

class InitialConfirmFlightReservationState
    extends ConfirmFlightReservationState {}

class SuccessConfirmFlightReservationState
    extends ConfirmFlightReservationState {}

class LoadingConfirmFlightReservationState
    extends ConfirmFlightReservationState {
     
    }

class FailureConfirmFlightReservationState
    extends ConfirmFlightReservationState {
<<<<<<< HEAD
 final ServerFailure serverFailure;
  FailureConfirmFlightReservationState(
      {required this.serverFailure});
=======
  final Failure failure;
  FailureConfirmFlightReservationState({required this.failure});
>>>>>>> Khalid
}
