import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/form_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
part 'form_states.dart';

class FormCubit extends Cubit<FormCubitState> {
  FormCubit(this.flightBookingImp) : super(FormInitial());
  final FlightBookingImp flightBookingImp;
  late List<PassengerModel?> passengers;
  late int seats;
  bool isForm = true;
  String? reservationId;
  FormModel? formModel;

  void initialize({
    required int seats,
    List<PassengerModel>? passengers,
    String? reservationId,
  }) {
    this.seats = seats;
    this.reservationId = reservationId;
    if (passengers != null) {
      isForm = false;
      this.passengers = passengers;
      return;
    }
    this.passengers = List.filled(seats, null);
  }

  bool checkFormValidity() {
    List<Map<String, String>> reservations = [];
    for (int i = 0; i < passengers.length; i++) {
      if (passengers[i] != null) {
        reservations.add(passengers[i]!.toJson());
      }
    }
    if (reservations.length != seats) {
      emit(FormNotFilled());
      return false;
    }
    return true;
  }

  Future<void> makeReservation({
    required List<String> flights,
    required String reservationType,
  }) async {
    emit(FormLoading());
    List<Map<String, String>> reservations = [];
    for (int i = 0; i < passengers.length; i++) {
      if (passengers[i] != null) {
        reservations.add(passengers[i]!.toJson());
      }
    }
    print(reservations);
    var response = await flightBookingImp.makeReservation(
      flights: flights,
      reservations: reservations,
      reservationType: reservationType,
    );
    //emit(FormInitial());
    response.fold(
      (failure) {
        emit(FormFailure(failure: failure));
      },
      (reservation) {
        formModel = FormModel.fromJson(reservation['reservation']);
        emit(FormSuccess(reservationId: formModel!.id));
      },
    );
  }

  Future<void> makeTripReservations(OrganizingTripCubit trip) async {
    emit(FormLoading());
    // var response = await
  }

  Future<void> cancleReservation({
    required String reserveId,
    required String personId,
    required int index,
  }) async {
    emit(DeleteLoading());
    var response = await flightBookingImp.cancelReservation(
      reserveId: reserveId,
      personId: personId,
    );
    response.fold(
      (failure) {
        emit(DeleteFailure(failure: failure));
      },
      (reservation) {
        emit(DeleteSuccess());
        removePassenger(index);
      },
    );
  }

  void addPassenger(int index, Map<String, dynamic> passenger) {
    passengers[index] = PassengerModel.fromJson(passenger);
    emit(PassengerAdd());
  }

  void removePassenger(int index) {
    for (int i = index; i < passengers.length - 1; i++) {
      passengers[i] = passengers[i + 1];
    }
    seats--;
    emit(PassengerDelete());
  }
}
