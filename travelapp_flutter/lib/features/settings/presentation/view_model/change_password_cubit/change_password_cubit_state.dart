import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ChangePasswordStates {}

class InitialChangePassword extends ChangePasswordStates {}

class SuccessChangePassword extends ChangePasswordStates {
  final String successMessage;

  SuccessChangePassword({required this.successMessage});
  
}

class LoadingChangePassword extends ChangePasswordStates {}

class FailureChangePassword extends ChangePasswordStates {
  final Failure failure;

  FailureChangePassword({required this.failure});
}
