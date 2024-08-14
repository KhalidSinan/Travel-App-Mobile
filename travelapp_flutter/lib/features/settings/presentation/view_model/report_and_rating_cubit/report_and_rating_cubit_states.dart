import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ReportAndRatingStates {}

class InitialReportAndRatingState extends ReportAndRatingStates {}

class SuccessReportABugState extends ReportAndRatingStates {
  final String successMessage;

  SuccessReportABugState({required this.successMessage});
}

class LoadingReportABugState extends ReportAndRatingStates {}

class FailureReportABugState extends ReportAndRatingStates {
  final Failure failure;

  FailureReportABugState({required this.failure});
}

class LoadingRatingAppState extends ReportAndRatingStates {}

class SuccessRatingAppState extends ReportAndRatingStates {
  final String successMessage;

  SuccessRatingAppState({required this.successMessage});
}

class FailureRatingAppState extends ReportAndRatingStates {
  final Failure failure;

  FailureRatingAppState({required this.failure});
}
