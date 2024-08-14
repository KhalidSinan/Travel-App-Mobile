import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class HomeRepo {

Future<Either<Failure, Map<String, dynamic>>> getFlightReservations();

Future<Either<Failure, Map<String, dynamic>>> getHotelReservations();

Future<Either<Failure, Map<String, dynamic>>> getAnnouncements();

Future<Either<Failure, Map<String, dynamic>>> getNearbyPlaces();

Future<Either<Failure, Map<String, dynamic>>> getMySingleTrips();

Future<Either<Failure, Map<String, dynamic>>> getMyGroupTrips();

Future<Either<Failure, Map<String, dynamic>>> getOrganizerTrips();

Future<Either<Failure, Map<String, dynamic>>> getTimer();

Future<Either<Failure, Map<String, dynamic>>> getHotelReservationDetails(
      {required String id});
}
