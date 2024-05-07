import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';

class ConfirmFlightReservationCubit
    extends Cubit<ConfirmFlightReservationState> {
  ConfirmFlightReservationCubit(this.flightBookingImp)
      : super(InitialConfirmFlightReservationState());

  final FlightBookingImp flightBookingImp;

  ReservationModel? reservation;

  Future<void> getFlightReservationData({required String idflight}) async {
    emit(LoadingConfirmFlightReservationState());

    var response =
        await flightBookingImp.getFlightReservationData(id: idflight);
    print(response);
    response.fold(
      (error) {
        if (error is ServerFailure) {
          emit(FailureConfirmFlightReservationState(
          serverFailure: error
          ));
        }
      },
      (res) {
        reservation = ReservationModel.fromJson(res['reservation']);
        print(res['reservation']);
        emit(SuccessConfirmFlightReservationState());
      },
    );
  }

  Future<void> postRservationConfirmation({required String id}) async {
    emit(LoadingConfirmFlightReservationState());
    var response = await flightBookingImp.postRservationConfirmation(id: id);
    print(response);
    response.fold(
      (error) {
        if (error is ServerFailure) {
          emit(FailureConfirmFlightReservationState(serverFailure: error));
        }
      },
      (res) {
        emit(SuccessConfirmFlightReservationState());
      },
    );
  }
}
