import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';

class ConfirmFlightReservationCubit
    extends Cubit<ConfirmFlightReservationState> {
  ConfirmFlightReservationCubit(this.flightBookingImp,
      {required this.reservationId})
      : super(InitialConfirmFlightReservationState());

  final FlightBookingImp flightBookingImp;
  final String reservationId;
  bool isConfirmed = false;
  ReservationModel? reservation;

  Future<void> getFlightReservationData({required String idflight}) async {
    emit(LoadingConfirmFlightReservationState());
    var response =
        await flightBookingImp.getFlightReservationData(id: idflight);
    print(response);
    response.fold(
      (error) {
        emit(FailureConfirmFlightReservationState(failure: error));
      },
      (res) {
        reservation = ReservationModel.fromJson(res['reservation']);
        isConfirmed = res['reservation']['is_confirmed'];
        emit(SuccessConfirmFlightReservationState());
      },
    );
  }

  Future<void> postReservationConfirmation({required String id}) async {
    emit(LoadingConfirmFlightReservationState());
    var response = await flightBookingImp.postReservationConfirmation(id: id);
    print(response);
    response.fold(
      (error) {
        emit(FailureConfirmFlightReservationState(failure: error));
      },
      (res) {
        isConfirmed = true;
        emit(SuccessConfirmFlightReservationState());
      },
    );
  }
}
