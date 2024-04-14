abstract class EmailConfirmStates {}

class InitialEmailConfirmState extends EmailConfirmStates {}

class LoadingEmailConfirmState extends EmailConfirmStates {}

class SuccessEmailConfirmState extends EmailConfirmStates {}

class FailureEmailConfirmState extends EmailConfirmStates {
  final String errMessage;
  final String? errTitle;

  FailureEmailConfirmState({required this.errMessage, this.errTitle});
}
