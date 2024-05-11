import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ProfileStates {}

class InitialProfile extends ProfileStates {}

class GetDataLoading extends ProfileStates {}

class GetDataSuccess extends ProfileStates {}

class GetDataFailure extends ProfileStates {
  final Failure failure;

  GetDataFailure({required this.failure});
}
