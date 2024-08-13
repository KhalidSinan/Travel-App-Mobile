import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class BecomeOrganizerStates {}

class BecomeOrganizerInitialState extends BecomeOrganizerStates {}

class BecomeOrganizerSuccessState extends BecomeOrganizerStates {
  final String successMessage;

  BecomeOrganizerSuccessState({required this.successMessage});
}

class BecomeOrganizerLoadingState extends BecomeOrganizerStates {}

class BecomeOrganizerFailureState extends BecomeOrganizerStates {
  final Failure failure;
  BecomeOrganizerFailureState({required this.failure});
}
