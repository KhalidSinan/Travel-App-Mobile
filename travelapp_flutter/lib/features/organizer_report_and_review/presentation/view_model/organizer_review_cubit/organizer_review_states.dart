import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class OrganizerReviewStates {}

class InitialReviewState extends OrganizerReviewStates {}

class LoadingReviewState extends OrganizerReviewStates {}

class FailureReviewState extends OrganizerReviewStates {
  final Failure failure;

  FailureReviewState({required this.failure});
}

class ChangeRating extends OrganizerReviewStates {}

class SuccessReviewState extends OrganizerReviewStates {}
