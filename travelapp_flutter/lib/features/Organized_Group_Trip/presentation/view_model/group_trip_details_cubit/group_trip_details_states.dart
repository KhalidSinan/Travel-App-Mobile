import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class GroupTripDetailsState {}

class GroupTripDetailsInitialState extends GroupTripDetailsState {}

class GroupTripDetailsLoadingState extends GroupTripDetailsState {}

class GroupTripDetailsFailureState extends GroupTripDetailsState {
  final Failure failure;

  GroupTripDetailsFailureState({required this.failure});
}

class GroupTripDetailsSuccessState extends GroupTripDetailsState {}

class GroupTripChangeDestinationState extends GroupTripDetailsState {}

class DeleteGroupTripSuccessState extends GroupTripDetailsState {}

class LoadingJoinGroupChatState extends GroupTripDetailsState {}

class FailureJoinGroupChatState extends GroupTripDetailsState {
  final Failure failure;

  FailureJoinGroupChatState({required this.failure});
}

class SuccessJoinGroupChatState extends GroupTripDetailsState {}
