abstract class RegistersStates {}

class InitialRegisterState extends RegistersStates {}

class LoadingRegisterState extends RegistersStates {}

class SuccessRegisterState extends RegistersStates {}

class FailureRegisterState extends RegistersStates {
  final String errMessage;

  FailureRegisterState({required this.errMessage});
}
