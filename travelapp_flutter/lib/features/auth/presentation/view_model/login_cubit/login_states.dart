abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {
  final String token;

  SuccessLoginState({required this.token});
}

class LoadingLoginState extends LoginStates {}

class FailureLoginState extends LoginStates {
  final String errMessage;
  final String? errTitle;

  FailureLoginState({required this.errMessage, this.errTitle});
}
