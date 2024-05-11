import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class AllFlightsStates {}

class InitialAllFlightsState extends AllFlightsStates {}

class LoadingGetAllFlightsState extends AllFlightsStates {}

class SuccessGetAllFlightsState extends AllFlightsStates {}

class NoFlightsState extends AllFlightsStates {}

class FailureGetAllFlightsState extends AllFlightsStates {
  final Failure failure;

  FailureGetAllFlightsState({required this.failure});
}
