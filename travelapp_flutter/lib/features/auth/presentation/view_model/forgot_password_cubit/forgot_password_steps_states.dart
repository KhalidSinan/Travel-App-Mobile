abstract class ForgotPasswordStepsState {}

class InitialStepState extends ForgotPasswordStepsState {}

class SuccessStepState extends ForgotPasswordStepsState {}

class LoadingStepState extends ForgotPasswordStepsState {}

class FinalStepState extends ForgotPasswordStepsState {
  final String message;

  FinalStepState({required this.message});
}

class FailureStepState extends ForgotPasswordStepsState {
  final String errMessage;

  FailureStepState({required this.errMessage});
}
