import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class GroupTripParticipantsStates {}

class InitialParticipantsState extends GroupTripParticipantsStates {}

class LoadingParticipantsState extends GroupTripParticipantsStates {}

class SuccessParticipantsState extends GroupTripParticipantsStates {}

class FailureParticipantsState extends GroupTripParticipantsStates {
  final Failure failure;

  FailureParticipantsState({required this.failure});
}

class NoParticipantsState extends GroupTripParticipantsStates {}

class LoadingCancelReservationState extends GroupTripParticipantsStates {}

class FailureCancelReservationState extends GroupTripParticipantsStates {
  final Failure failure;

  FailureCancelReservationState({required this.failure});
}

class SuccessCancelReservationState extends GroupTripParticipantsStates {}
