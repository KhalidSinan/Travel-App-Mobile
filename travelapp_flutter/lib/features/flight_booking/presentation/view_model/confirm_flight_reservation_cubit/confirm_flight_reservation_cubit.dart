import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';

class ConfirmFlightReservationCubit
    extends Cubit<ConfirmFlightReservationState> {
  ConfirmFlightReservationCubit(super.initialState);

  List<ReservationModel> tickets = [];

  Future<void> getFlightReservationData({required String idflight}) async {
    emit(LoadingConfirmFlightReservationState());
  }
}
