import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class GroupTripDetailsState {}

class GroupTripDetailsInitialState extends GroupTripDetailsState {}

class GroupTripDetailsLoadingState extends GroupTripDetailsState {}

class GroupTripDetailsFailureState extends GroupTripDetailsState {
  final Failure failure;

  GroupTripDetailsFailureState({required this.failure});
}

class GroupTripDetailsSuccessState extends GroupTripDetailsState {}
