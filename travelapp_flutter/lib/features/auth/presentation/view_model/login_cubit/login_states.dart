abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}

class FailureLoginState extends LoginStates {
  final String errMessage;
  final String? errTitle;

  FailureLoginState({required this.errMessage, this.errTitle});
}

class LoadingFingerprintState extends LoginStates {}

class SuccessFingerprintState extends LoginStates {}

class FailureFingerprintState extends LoginStates {}
