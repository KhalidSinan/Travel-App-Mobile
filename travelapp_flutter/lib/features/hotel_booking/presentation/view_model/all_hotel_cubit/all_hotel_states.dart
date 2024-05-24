import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class AllHotelStates {}

class InitialAllHotelStates extends AllHotelStates {}

class LoadingAllHotelStates extends AllHotelStates {}

class SuccessAllHotelStates extends AllHotelStates {}

class NoHotelsState extends AllHotelStates {}

class FailureGetAllHotelsState extends AllHotelStates {
  final Failure failure;

  FailureGetAllHotelsState({required this.failure});
}
