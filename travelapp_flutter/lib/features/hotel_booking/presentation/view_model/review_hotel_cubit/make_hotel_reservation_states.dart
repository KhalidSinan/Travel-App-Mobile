import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class MakeHotelReservationState {}

class InitialReviewHotelState extends MakeHotelReservationState {}

class SuccessReviewHotelState extends MakeHotelReservationState {}

class LoadingReviewHotelState extends MakeHotelReservationState {}

class FailureReviewHotelState extends MakeHotelReservationState {
  final Failure failure;

  FailureReviewHotelState({required this.failure});
}
