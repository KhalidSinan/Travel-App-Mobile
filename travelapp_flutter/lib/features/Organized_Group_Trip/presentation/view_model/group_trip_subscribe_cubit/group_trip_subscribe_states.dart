import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class GroupTripSubscribeStates {}

class InitialSubscribeState extends GroupTripSubscribeStates {}

class LoadingSubscribeState extends GroupTripSubscribeStates {}

class FailureSubscribeState extends GroupTripSubscribeStates {
  final Failure failure;

  FailureSubscribeState({required this.failure});
}

class SuccessSubscribeState extends GroupTripSubscribeStates {}
