import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';

abstract class OrganizingTripRepo {
  Future<Either<Failure, Map<String, dynamic>>> getCitiesAndAirlines();
  Future<Either<Failure, Map<String, dynamic>>> checkFlightsForTrip({
    required String source,
    required bool isReturn,
    required List<Map<String, dynamic>> destinations,
    required String classType,
    required int daysTrip,
    required int numPersons,
    required String startDate,
  });
  Future<Either<Failure, Map<String, dynamic>>> getPlaces(
      {required String city, required String category});

  Future<Either<Failure, Map<String, dynamic>>> makeTrip({
    required OrganizingTripCubit trip,
    required List<String> flightsReservations,
    required List<String> hotelsReservations,
  });
}
