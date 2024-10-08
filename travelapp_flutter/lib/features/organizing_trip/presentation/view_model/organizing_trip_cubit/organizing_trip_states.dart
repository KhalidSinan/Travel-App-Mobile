import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class OrganizingTripStates {}

class InitialOrganizingTrip extends OrganizingTripStates {}

class LoadingOrganizingTrip extends OrganizingTripStates {}

class SuccessCheckAvailableFlight extends OrganizingTripStates {}

class DeleteDestination extends OrganizingTripStates {}

class AddDestination extends OrganizingTripStates {}

class PlacesSuccess extends OrganizingTripStates {}

class FailureOrganizingTrip extends OrganizingTripStates {
  final Failure failure;
  FailureOrganizingTrip({required this.failure});
}

class EditScheduleState extends OrganizingTripStates {}

class NextPageState extends OrganizingTripStates {
  int? page;
  NextPageState(this.page);
}

class PreviousPageState extends OrganizingTripStates {}
