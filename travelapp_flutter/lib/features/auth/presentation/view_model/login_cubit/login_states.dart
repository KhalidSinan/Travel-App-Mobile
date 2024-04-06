abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}

class FailureLoginState extends LoginStates {
  final String errMessage;

  FailureLoginState({required this.errMessage});
}
