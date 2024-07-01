import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class OrganizingTripRepo {
  Future<Either<Failure, Map<String, dynamic>>> getCitiesAndAirlines();

  Future<Either<Failure, Map<String, dynamic>>> getPlaces({required String city, required String category});
}
