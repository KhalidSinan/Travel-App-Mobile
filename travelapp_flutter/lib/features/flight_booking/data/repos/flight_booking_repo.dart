import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/two_way_flight_model.dart';

abstract class FlightBookingRepo {
  Future<Either<Failure, Map<String, dynamic>>> getFlightReservationData(
      {required String id});
  Future<Either<Failure, List<OneWayFlightModel>>> getAllOneWayFlights({
    required String source,
    required String destination,
    required String date,
    required int seats,
    required String seatsClass,
    String? sortBy,
    String? sort,
    String? timeStart,
    String? timeEnd,
    String? airline,
    String? minPrice,
    String? maxPrice,
    int? page,
  });
  Future<Either<Failure, List<TwoWayFlightModel>>> getAllTwoWayFlights({
    required String source,
    required String destination,
    required String date,
    required int seats,
    required String seatsClass,
    required String dateEnd,
    String? sortBy,
    String? sort,
    String? timeStart,
    String? timeEnd,
    String? airline,
    String? minPrice,
    String? maxPrice,
    int? page,
  });
  Future<Either<Failure, Map<String, dynamic>>> getCountriesAndAirlines();

  Future<Either<Failure, Map<String, dynamic>>> postSearchFlight(
      {required String source,
      required String destination,
      required String date,
      required String? dateEnd,
      required bool twoWay,
      required String classOfSeats,
      required String numOfSeats});

  Future<Either<Failure, Map<String, dynamic>>> getFlightDetails(
      {required String id, required String classType, String? idback});

  Future<Either<Failure, Map<String, dynamic>>> makeReservation(
      {required List<String> flights,
      required List<Map<String, String>> reservations,
      required String reservationType});

  Future<Either<Failure, Map<String, dynamic>>> postReservationConfirmation(
      {required String id});

  Future<Either<Failure, Map<String, dynamic>>> cancelReservation({
    required String reserveId,
    required String personId,
  });
}
