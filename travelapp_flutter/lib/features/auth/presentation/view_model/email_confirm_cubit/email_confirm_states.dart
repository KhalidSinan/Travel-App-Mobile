import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class EmailConfirmStates {}

class InitialEmailConfirmState extends EmailConfirmStates {}

class LoadingEmailConfirmState extends EmailConfirmStates {}

class SuccessEmailConfirmState extends EmailConfirmStates {}

class FailureEmailConfirmState extends EmailConfirmStates {
  final Failure failure;

  FailureEmailConfirmState({required this.failure});
}

class SuccessResendCodeState extends EmailConfirmStates {}
