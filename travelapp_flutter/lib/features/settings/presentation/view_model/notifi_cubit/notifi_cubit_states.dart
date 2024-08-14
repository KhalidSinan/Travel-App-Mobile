import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/settings/data/models/all_notifi_model.dart';

class NotifiStates {}

class NotifiInitial extends NotifiStates {}

class NotifiSuccessState extends NotifiStates {
  final AllNotifiModel ?allNotifiModel;

  NotifiSuccessState({ this.allNotifiModel});
}

class NotifiLoadingState extends NotifiStates {}

class NotifiFailureState extends NotifiStates {
  final Failure failure;
  NotifiFailureState({required this.failure});
}
