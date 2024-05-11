import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_states.dart';

class AllFlightsCubit extends Cubit<AllFlightsStates> {
  AllFlightsCubit(this._flightBookingImp) : super(InitialAllFlightsState());
  final FlightBookingImp _flightBookingImp;

  List<dynamic>? flights;
  bool? isTwoWay;
  String? source;
  String? destination;
  int? seats;
  String? seatsClass;
  String? departureDate;
  String? dateEnd;
  String? sortBy; // eg. time_asc , price_desc
  String? timeStart;
  String? timeEnd;
  String? airline;
  int page = 1;
  late int totalFlights;
  late List<dynamic> airlines;
  RangeValues prices = const RangeValues(0, 3000);

  void initialize(
    List<dynamic> flights,
    List<dynamic> airlines,
    bool isTwoWay,
    String departureDate,
    String source,
    String destination,
    int seats,
    String seatsClass,
    String? dateEnd,
  ) {
    this.flights = flights;
    this.airlines = airlines;
    this.isTwoWay = isTwoWay;
    this.departureDate = departureDate;
    this.source = source;
    this.destination = destination;
    this.seats = seats;
    this.seatsClass = seatsClass;
    this.dateEnd = dateEnd;
    totalFlights = flights.length;
    emit(SuccessGetAllFlightsState());
  }

  Future<void> changeDate(String sendDate) async {
    departureDate = sendDate;
    page = 1;
    restartSortingAndFiltering();
    if (isTwoWay!) {
      await getAllTwoWayFlights(
        source: source!,
        destination: destination!,
        date: sendDate,
        seats: seats!,
        seatsClass: seatsClass!,
        dateEnd: dateEnd!,
      );
    } else {
      await getAllOneWayFlights(
        source: source!,
        destination: destination!,
        date: sendDate,
        seats: seats!,
        seatsClass: seatsClass!,
      );
    }
  }

  void restartSortingAndFiltering() {
    sortBy = null;
    timeStart = null;
    timeEnd = null;
    airline = null;
    prices = const RangeValues(0, 3000);
  }

  Future<void> applySorting() async {
    if (isTwoWay!) {
      await getAllTwoWayFlights(
        source: source!,
        destination: destination!,
        date: departureDate!,
        seats: seats!,
        seatsClass: seatsClass!,
        dateEnd: dateEnd!,
        page: page,
      );
    } else {
      await getAllOneWayFlights(
        source: source!,
        destination: destination!,
        date: departureDate!,
        seats: seats!,
        seatsClass: seatsClass!,
        page: page,
      );
    }
  }

  Future<void> changePage(int page) async {
    this.page = page;
    if (isTwoWay!) {
      await getAllTwoWayFlights(
        source: source!,
        destination: destination!,
        date: departureDate!,
        seats: seats!,
        seatsClass: seatsClass!,
        dateEnd: dateEnd!,
        page: page,
      );
    } else {
      await getAllOneWayFlights(
        source: source!,
        destination: destination!,
        date: departureDate!,
        seats: seats!,
        seatsClass: seatsClass!,
        page: page,
      );
    }
  }

  Future<void> applyFiltering() async {
    if (isTwoWay!) {
      await getAllTwoWayFlights(
        source: source!,
        destination: destination!,
        date: departureDate!,
        seats: seats!,
        seatsClass: seatsClass!,
        dateEnd: dateEnd!,
        page: page,
      );
    } else {
      await getAllOneWayFlights(
        source: source!,
        destination: destination!,
        date: departureDate!,
        seats: seats!,
        seatsClass: seatsClass!,
        page: page,
        // dateEnd: '09/05/2024',
      );
    }
  }

  Future<void> retry() async {
    if (isTwoWay!) {
      await getAllTwoWayFlights(
        source: source!,
        destination: destination!,
        date: departureDate!,
        seats: seats!,
        seatsClass: seatsClass!,
        dateEnd: dateEnd!,
        page: page,
      );
    } else {
      await getAllOneWayFlights(
        source: source!,
        destination: destination!,
        date: departureDate!,
        seats: seats!,
        seatsClass: seatsClass!,
      );
    }
  }

  Future<void> getAllOneWayFlights({
    required String source,
    required String destination,
    required String date,
    required int seats,
    required String seatsClass,
    int? page,
  }) async {
    emit(LoadingGetAllFlightsState());
    var response = await _flightBookingImp.getAllOneWayFlights(
      source: source,
      destination: destination,
      date: date,
      seats: seats,
      seatsClass: seatsClass,
      sortBy: sortBy?.split('_')[0], // price_desc => price
      sort: sortBy?.split('_')[1], // price_desc => desc
      airline: airline,
      timeStart: timeStart,
      timeEnd: timeEnd,
      minPrice: prices.start.toString(),
      maxPrice: prices.end.toString(),
      page: page,
    );
    response.fold(
      (failure) {
        print(failure.errMessage);
        emit(FailureGetAllFlightsState(failure: failure));
      },
      (allFlights) {
        flights = allFlights;
        if (page == null) {
          totalFlights = flights!.length;
        }
        print(flights!.length);
        if (flights!.isEmpty) {
          emit(NoFlightsState());
        } else {
          emit(SuccessGetAllFlightsState());
        }
      },
    );
  }

  Future<void> getAllTwoWayFlights({
    required String source,
    required String destination,
    required String date,
    required int seats,
    required String seatsClass,
    required String dateEnd,
    int? page,
  }) async {
    emit(LoadingGetAllFlightsState());
    var response = await _flightBookingImp.getAllTwoWayFlights(
      source: source,
      destination: destination,
      date: date,
      seats: seats,
      seatsClass: seatsClass,
      dateEnd: dateEnd,
      sortBy: sortBy?.split('_')[0], // eg. time_asc => time
      sort: sortBy?.split('_')[1], // eg. time_asc => asc
      airline: airline,
      timeStart: timeStart,
      timeEnd: timeEnd,
      minPrice: prices.start.toString(),
      maxPrice: prices.end.toString(),
      page: page,
    );
    response.fold(
      (failure) {
        print(failure.errMessage);
        emit(FailureGetAllFlightsState(failure: failure));
      },
      (allFlights) {
        flights = allFlights;
        if (page == null) {
          totalFlights = flights!.length;
        }
        if (flights!.isEmpty) {
          emit(NoFlightsState());
        } else {
          emit(SuccessGetAllFlightsState());
        }
      },
    );
  }
}
