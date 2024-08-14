import 'package:travelapp_flutter/core/helpers/failure.dart';

class MyTripsState {}

class MyTripsInitial extends MyTripsState {}

class MyTripsSuccess extends MyTripsState {}

class MyTripsLoading extends MyTripsState {}

class MyTripsHalfSuccess extends MyTripsState {}

class MyTripsFailure extends MyTripsState {
  final Failure failure;
  MyTripsFailure({required this.failure});
}
