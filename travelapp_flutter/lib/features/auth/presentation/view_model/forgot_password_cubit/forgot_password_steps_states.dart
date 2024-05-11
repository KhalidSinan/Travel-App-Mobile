import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ForgotPasswordStepsState {}

class InitialStepState extends ForgotPasswordStepsState {}

class SuccessStepState extends ForgotPasswordStepsState {}

class LoadingStepState extends ForgotPasswordStepsState {}

class FinalStepState extends ForgotPasswordStepsState {
  final String message;

  FinalStepState({required this.message});
}

class FailureStepState extends ForgotPasswordStepsState {
  final Failure failure;

  FailureStepState({required this.failure});
}
