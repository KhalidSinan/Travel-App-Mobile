import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class OrganizingGroupTripRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAllOrganizedTrips({required int page, required String source});
  Future<Either<Failure,Map<String,dynamic>>> getAllCountries();
}
