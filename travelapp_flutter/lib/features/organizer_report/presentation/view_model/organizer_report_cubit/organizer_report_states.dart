import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class OrganizerReportStates {}

class InitialGetOrganizersState extends OrganizerReportStates {}

class LoadingGetOrganizersState extends OrganizerReportStates {}

class FailureGetOrganizersState extends OrganizerReportStates {
  final Failure failure;

  FailureGetOrganizersState({required this.failure});
}

class NoOrganizersState extends OrganizerReportStates {}

class SuccessGetOrganizersState extends OrganizerReportStates {}

class SuccessOrganizerReportState extends OrganizerReportStates {}

class LoadingOrganizerReportState extends OrganizerReportStates {}

class FailureOrganizerReportState extends OrganizerReportStates {
  final Failure failure;

  FailureOrganizerReportState({required this.failure});
}
