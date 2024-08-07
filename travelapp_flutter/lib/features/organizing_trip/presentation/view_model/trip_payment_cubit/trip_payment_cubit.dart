import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/available_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_reservation_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/trip_payment_cubit/trip_payment_states.dart';

class TripPaymentCubit extends Cubit<TripPaymentState> {
  TripPaymentCubit({
    required this.organizingTripImpl,
    required this.flightBookingImp,
    required this.hotelBookingImp,
    required this.seats,
    required this.passengers,
    required this.trip,
  }) : super(InitialTripPaymentState());

  final OrganizingTripImpl organizingTripImpl;
  final FlightBookingImp flightBookingImp;
  final HotelBookingImp hotelBookingImp;
  final int seats;
  final List<PassengerModel?> passengers;
  final OrganizingTripCubit trip;
  List<String> flightsResIds = [];
  List<String> hotelsResIds = [];
  int step = 0;
  String stepName = 'Initializing...';
  double stepValue = 0.0;

  Future<void> makeTrip() async {
    flightsResIds = [];
    hotelsResIds = [];
    nextStep();
    bool flightsSuccess = await tripFlightsReservations(
      flights: trip.availableFlightModel,
      passengers: passengers,
    );
    if (!flightsSuccess) return;
    nextStep();
    bool hotelsSuccess = await tripHotelsReservations(hotels: trip.allHotels!);
    if (!hotelsSuccess) return;
    nextStep();
    await createTrip(
      trip: trip,
      flightsResIds: flightsResIds,
      hotelsResIds: hotelsResIds,
    );
    nextStep();
  }

  Future<void> createTrip({
    required OrganizingTripCubit trip,
    required List<String> flightsResIds,
    required List<String> hotelsResIds,
  }) async {
    emit(TripCreateLoadingState());
    var response = await organizingTripImpl.makeTrip(
      trip: trip,
      flightsReservations: flightsResIds,
      hotelsReservations: hotelsResIds,
    );
    response.fold(
      (failure) {
        emit(TripCreateFailureState(errMessage: failure.errMessage));
      },
      (res) {
        emit(TripCreateSuccessState(tripId: res['data']['id']));
      },
    );
  }

  Future<bool> tripFlightsReservations({
    required List<AvailableFlightModel> flights,
    required List<PassengerModel?> passengers,
  }) async {
    emit(FlightsReservationLoadingState());
    List<Map<String, String>> reservations = [];
    for (int i = 0; i < passengers.length; i++) {
      if (passengers[i] != null) {
        reservations.add(passengers[i]!.toJson());
      }
    }
    for (var flight in flights) {
      var response = await flightBookingImp.makeReservation(
        flights: [flight.flight!.id],
        reservations: reservations,
        reservationType: 'One-Way',
      );
      response.fold(
        (failure) {
          emit(TripCreateFailureState(errMessage: failure.errMessage));
          return false;
        },
        (res) {
          emit(FlightsReservationSuccessState());
          flightsResIds.add(res['reservation']['_id']);
        },
      );
    }
    return true;
  }

  Future<bool> tripHotelsReservations({
    required HotelReservationModel hotels,
  }) async {
    emit(HotelsReservationLoadingState());
    for (var hotel in hotels.hotels) {
      List<Map<String, dynamic>> rooms = [];
      for (var room in hotel!.rooms) {
        rooms.add(room.toJson());
      }
      DateTime date = DateFormat('dd/M/yyyy').parse(hotel.startDate);
      String formattedStartDate = DateFormat('yyyy-MM-dd').format(date);
      var response = await hotelBookingImp.makeHotelReservation(
        hotelId: hotel.hotelId,
        roomCodes: rooms,
        startDate: formattedStartDate,
        numDays: hotel.numDays.toString(),
      );
      response.fold(
        (failure) {
          emit(TripCreateFailureState(errMessage: failure.errMessage));
          return false;
        },
        (res) {
          emit(HotelsReservationSuccessState());
          hotelsResIds.add(res['_id']);
        },
      );
    }
    return true;
  }

  void nextStep() {
    step++;
    switch (step) {
      case 1:
        stepName = 'Flights Reservation...';
        stepValue = 0.3;
        break;
      case 2:
        stepName = 'Hotels Reservation...';
        stepValue = 0.6;
        break;
      case 3:
        stepName = 'Creating The Trip...';
        stepValue = 0.9;
        break;
      case 4:
        stepName = 'Trip Created Successfully';
        stepValue = 1.0;
        break;
      default:
        stepName = 'Initializing...';
        stepValue = 0.0;
    }
  }
}
