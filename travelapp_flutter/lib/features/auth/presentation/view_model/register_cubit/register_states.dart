import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class RegistersStates {}

class InitialRegisterState extends RegistersStates {}

class LoadingRegisterState extends RegistersStates {}

class SuccessRegisterState extends RegistersStates {}

class FailureRegisterState extends RegistersStates {
  final Failure failure;

  FailureRegisterState({required this.failure});
}
