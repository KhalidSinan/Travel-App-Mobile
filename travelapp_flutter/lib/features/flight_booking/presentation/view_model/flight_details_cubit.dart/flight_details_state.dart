part of 'flight_details_cubit.dart';

abstract class FlightDetailsState {}

class FlightDetailsInitial extends FlightDetailsState {}

class FlightDetailsLoading extends FlightDetailsState {}

class FlightDetailsSuccess extends FlightDetailsState {}

class FlightDetailsFailure extends FlightDetailsState {
  final Failure failure;

  FlightDetailsFailure({required this.failure});
}
