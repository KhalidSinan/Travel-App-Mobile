abstract class TripPaymentState {}

class InitialTripPaymentState extends TripPaymentState {}

class FlightsReservationLoadingState extends TripPaymentState {}

class FlightsReservationSuccessState extends TripPaymentState {}

class HotelsReservationLoadingState extends TripPaymentState {}

class HotelsReservationSuccessState extends TripPaymentState {}

class TripCreateLoadingState extends TripPaymentState {}

class TripCreateFailureState extends TripPaymentState {
  final String errMessage;

  TripCreateFailureState({required this.errMessage});
}

class TripCreateSuccessState extends TripPaymentState {
  final String tripId;

  TripCreateSuccessState({required this.tripId});
}
