import 'package:bloc/bloc.dart';
import 'package:travelapp_flutter/features/home/data/models/flight_reservations_model.dart';
import 'package:travelapp_flutter/features/home/data/models/hotel_reservations_model.dart';
import 'package:travelapp_flutter/features/home/data/models/room_model.dart';
import 'package:travelapp_flutter/features/home/data/repos/home_repo_impl.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_state.dart';

class MyReservationsCubit extends Cubit<MyReservationsState> {
  MyReservationsCubit(this.homeRepoImpl) : super(MyReservationsInitial());

  final HomeRepoImpl homeRepoImpl;
  bool switcher = false;
  List<FlightReservationsModel> flightReservations = [];
  List<HotelReservationsModel> hotelReservations = [];
  List<FlightReservationsModel> currentFlights = [];
  List<FlightReservationsModel> latestFlights = [];
  List<HotelReservationsModel> currentHotels = [];
  List<HotelReservationsModel> latestHotels = [];
  List<RoomModel> rooms = [];

  Future<void> getFlightReservations() async {
    var response = await homeRepoImpl.getFlightReservations();
    response.fold(
      (failure) => emit(MyReservationsFailure(failure: failure)),
      (response) {
        flightReservations = [];
        for (var i = 0; i < response['data'].length; i++) {
          flightReservations
              .add(FlightReservationsModel.fromJson(response["data"][i]));
        }
        currentFlights = [];
        latestFlights = [];
        if (flightReservations.isNotEmpty) {
          for (var i = 0; i < flightReservations.length; i++) {
            if (flightReservations[i].completed) {
              latestFlights.add(flightReservations[i]);
            } else {
              currentFlights.add(flightReservations[i]);
            }
          }
        }
      },
    );
  }

  Future<void> getHotelReservations() async {
    var response = await homeRepoImpl.getHotelReservations();
    response.fold(
      (failure) => emit(MyReservationsFailure(failure: failure)),
      (response) {
        hotelReservations = [];
        for (var i = 0; i < response['data'].length; i++) {
          hotelReservations
              .add(HotelReservationsModel.fromJson(response["data"][i]));
        }
        currentHotels = [];
        latestHotels = [];
        if (hotelReservations.isNotEmpty) {
          for (var i = 0; i < hotelReservations.length; i++) {
            if (hotelReservations[i].completed) {
              latestHotels.add(hotelReservations[i]);
            } else {
              currentHotels.add(hotelReservations[i]);
            }
          }
        }
      },
    );
  }

  Future<void> getHotelReservationDetails({required String id}) async {
    emit(MyReservationsLoading());
    var response = await homeRepoImpl.getHotelReservationDetails(id: id);
    response.fold(
      (failure) => emit(MyReservationsFailure(failure: failure)),
      (response) {
        rooms = [];
        for (var i = 0; i < response['data']['rooms'].length; i++) {
          rooms.add(RoomModel.fromJson(response['data']['rooms'][i]));
        }
        emit(MyReservationsSuccess());
      },
    );
  }

  void switchState() {
    emit(MyReservationsSuccess());
  }

  Future<void> getReservations() async {
    emit(MyReservationsLoading());
    await getFlightReservations();
    await getHotelReservations();
    emit(MyReservationsSuccess());
  }
}
