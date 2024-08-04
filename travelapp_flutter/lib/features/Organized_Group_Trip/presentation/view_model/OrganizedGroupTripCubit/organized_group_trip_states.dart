import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class OrganizedGroupCubitState {}

class OrganizedGroupTripInitialState extends OrganizedGroupCubitState {}

class LoadingOrganizedGroupTripState extends OrganizedGroupCubitState {}

class SuccessOrganizedGroupTripState extends OrganizedGroupCubitState {}

class OrganizedGroupCubitUpdated extends OrganizedGroupCubitState {
  OrganizedGroupCubitUpdated(List list);
}

class FailureOrganizedGroupTripState extends OrganizedGroupCubitState {
  final Failure failure;
  

  FailureOrganizedGroupTripState({required this.failure});
}
