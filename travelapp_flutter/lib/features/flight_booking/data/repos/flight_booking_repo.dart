import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/two_way_flight_model.dart';

abstract class FlightBookingRepo {
  Future<Either<Failure, Map<String, dynamic>>> getFlightReservationData(
      {required String id});
<<<<<<< HEAD
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
=======

  Future<Either<Failure, Map<String, dynamic>>> postRservationConfirmation(
      {required String id});

  
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338
}
