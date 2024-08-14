import 'package:travelapp_flutter/core/helpers/failure.dart';

class MyReservationsState {}

class MyReservationsInitial extends MyReservationsState {}

class MyReservationsSuccess extends MyReservationsState {}

class MyReservationsHalfSuccess extends MyReservationsState {}

class MyReservationsLoading extends MyReservationsState {}

class HotelDetailsSuccess extends MyReservationsState {}

class MyReservationsFailure extends MyReservationsState {
  final Failure failure;
  MyReservationsFailure({required this.failure});
}
