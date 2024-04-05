abstract class AuthStates {}

abstract class LoginStates extends AuthStates {}

abstract class RegistersStates extends AuthStates {}

class InitialAuthState extends AuthStates {}

class InitialLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}

class FailureLoginState extends LoginStates {
  final String errMessage;

  FailureLoginState({required this.errMessage});
}

class InitialRegisterState extends RegistersStates {}

class LoadingRegisterState extends RegistersStates {}

class SuccessRegisterState extends RegistersStates {}

class FailureRegisterState extends RegistersStates {
  final String errMessage;

  FailureRegisterState({required this.errMessage});
}
