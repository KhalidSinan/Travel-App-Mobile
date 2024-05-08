abstract class AllFlightsStates {}

class InitialAllFlightsState extends AllFlightsStates {}

class LoadingGetAllFlightsState extends AllFlightsStates {}

class SuccessGetAllFlightsState extends AllFlightsStates {}

class NoFlightsState extends AllFlightsStates {}

class FailureGetAllFlightsState extends AllFlightsStates {
  final String errMessage;
  FailureGetAllFlightsState({required this.errMessage});
}
