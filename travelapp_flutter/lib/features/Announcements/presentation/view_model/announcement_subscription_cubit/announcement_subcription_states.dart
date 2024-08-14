import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class AnnouncementSubscriptionStates {}

class InitialGetSubscriptionsState extends AnnouncementSubscriptionStates {}

class LoadingGetSubscriptionsState extends AnnouncementSubscriptionStates {}

class FailureGetSubscriptionsState extends AnnouncementSubscriptionStates {
  final Failure failure;

  FailureGetSubscriptionsState({required this.failure});
}

class SuccessGetSubscriptionsState extends AnnouncementSubscriptionStates {}

class LoadingSubscribeState extends AnnouncementSubscriptionStates {}

class FailureSubscribeState extends AnnouncementSubscriptionStates {
  final Failure failure;

  FailureSubscribeState({required this.failure});
}

class SuccessSubscribeState extends AnnouncementSubscriptionStates {}

class SelectSubscribeState extends AnnouncementSubscriptionStates {}

class SelectedSubscribeHomeState extends AnnouncementSubscriptionStates {}
