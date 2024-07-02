import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/two_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit_states.dart';

class ReservationTicketCubit extends Cubit<ReservationTicketState> {
  final FlightBookingImp flightBookingImp;
  List<dynamic> countries = [];
  List<dynamic> airlines = [];

  
  String? seatClass;

  ReservationTicketCubit(this.flightBookingImp)
      : super(InitialReservationTicketState());

  Future<void> getCountriesAndAirlines() async {
    emit(LoadingReservationTicketState());

    var response = await flightBookingImp.getCountriesAndAirlines();

    response.fold(
      (failure) {
        emit(FailureReservationTicketState(failure: failure));
      },
      (res) {
        countries = (res['countries']);
        airlines = (res['airlines']);
        emit(SuccessReservationTicketState());
      },
    );
  }

  Future<void> postSearchFlight({
    required String source,
    required String destination,
    required String date,
    String? dateEnd,
    required bool twoWay,
    required String classOfSeats,
    required String numOfSeats,
  }) async {
    print(classOfSeats);
    emit(LoadingSearchFlightState());
    var response = await flightBookingImp.postSearchFlight(
      source: source,
      destination: destination,
      date: date,
      dateEnd: dateEnd,
      twoWay: twoWay,
      classOfSeats: classOfSeats,
      numOfSeats: numOfSeats,
    );
    response.fold(
      (failure) {
        emit(FailureSearchFlightState(failure: failure));
      },
      (res) async {
        List<dynamic> flights = [];
        if (twoWay) {
          for (int i = 0; i < res['data'].length; i++) {
            flights.add(TwoWayFlightModel.fromJson(res['data'][i]));
          }
        } else {
          for (int i = 0; i < res['data'].length; i++) {
            flights.add(OneWayFlightModel.fromJson(res['data'][i]['flight']));
          }
        }
        await Future.delayed(const Duration(milliseconds: 2000));
        emit(SuccessSearchFlightState(
          flights: flights,
          isTwoWay: twoWay,
          departureDate: date,
          source: source,
          destination: destination,
          seats: int.parse(numOfSeats),
          seatsClass: classOfSeats,
          dateEnd: dateEnd,
          airlines: airlines,
          totalFlights: res['count'],
        ));
      },
    );
  }

  void getClass({required String selectedClass}) {
    switch (selectedClass) {
      case 'First':
        seatClass = 'A';
      case 'Business':
        seatClass = 'B';
      case 'Economy':
        seatClass = 'C';
    }
  }
}
