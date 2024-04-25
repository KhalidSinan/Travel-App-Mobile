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
  List<ReservationModel> reservation = [];

  Future<void> getFlightReservationData({required String idflight}) async {
    emit(LoadingConfirmFlightReservationState());

    var response = await flightBookingImp.getFlightReservationData(
        id: "6624c48b096e5ace72ea858f");
    response.fold(
      (l) {
        if (l is ServerFailure) {
          emit(FailureConfirmFlightReservationState(
            errMessage: l.errMessage,
          ));
        }
      },
      (res) {
        reservation.add(ReservationModel.fromJson(res['reservation']));
        emit(SuccessConfirmFlightReservationState());
      },
    );
  }
}
