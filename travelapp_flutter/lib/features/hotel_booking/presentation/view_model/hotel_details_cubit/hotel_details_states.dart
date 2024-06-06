import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class HotelDetailsStates {}

class InitialHotelDetailsState extends HotelDetailsStates {}

class AddRoom extends HotelDetailsStates {}

class DeleteRoom extends HotelDetailsStates {}

class InitialReviewHotelState extends HotelDetailsStates {}

class SuccessReviewHotelState extends HotelDetailsStates {}

class LoadingReviewHotelState extends HotelDetailsStates {}

class FailureReviewHotelState extends HotelDetailsStates {
  final Failure failure;

  FailureReviewHotelState({required this.failure});
}

class RoomsFailureReviewHotelState extends HotelDetailsStates {
  final Map<String, bool> failure;

  RoomsFailureReviewHotelState({required this.failure});
}
