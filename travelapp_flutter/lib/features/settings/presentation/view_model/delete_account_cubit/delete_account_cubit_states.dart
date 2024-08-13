import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class DeleteAccountStates {}

class InitialDeleteAccount extends DeleteAccountStates {}

class LoadingCheckPassword extends DeleteAccountStates {}

class SuccessCheckPassword extends DeleteAccountStates {}

class FailureCheckPassword extends DeleteAccountStates {
  final Failure failure;

  FailureCheckPassword({required this.failure});
}

class LoadingDeleteAccount extends DeleteAccountStates {}

class SuccessDeleteAccount extends DeleteAccountStates {
  final String successMessage;

  SuccessDeleteAccount({required this.successMessage});
}

class FailureDeleteAccount extends DeleteAccountStates {
  final Failure failure;

  FailureDeleteAccount({required this.failure});
}
