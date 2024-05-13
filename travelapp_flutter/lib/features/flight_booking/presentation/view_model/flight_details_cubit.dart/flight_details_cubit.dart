import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/flight_details_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
part 'flight_details_state.dart';

class FlightDetailsCubit extends Cubit<FlightDetailsState> {
  FlightDetailsCubit(this.flightBookingImp) : super(FlightDetailsInitial());
  final FlightBookingImp flightBookingImp;
  FlightDetailsModel? flightdetails;

  // ignore: body_might_complete_normally_nullable
  Future<ReservationModel?> getFlightDetails(
      {required String flightid,
      required String classType,
      String? idback}) async {
    emit(FlightDetailsLoading());
    var data = await flightBookingImp.getFlightDetails(
      id: flightid,
      classType: classType,
      idback: idback,
    );
    print(data);
    data.fold(
      (failure) {
        emit(FlightDetailsFailure(failure: failure));
      },
      (flight) {
        flightdetails = FlightDetailsModel.fromJson(flight);
        emit(FlightDetailsSuccess());
      },
    );
  }
}
