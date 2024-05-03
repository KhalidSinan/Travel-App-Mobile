import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class FlightBookingRepo {
  Future<Either<Failure, Map<String, dynamic>>> getFlightReservationData(
      {required String id});

  Future<Either<Failure, Map<String, dynamic>>> postRservationConfirmation(
      {required String id});

  
}
