import 'package:travelapp_flutter/core/helpers/failure.dart';

class ShareTripState {}

class ShareTripInitial extends ShareTripState {}

class ShareTripLoading extends ShareTripState {}

class ShareTripSuccess extends ShareTripState {}

class ShareTripFailure extends ShareTripState {
  final Failure failure;
  ShareTripFailure({required this.failure});
}
