import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class OrganizingGroupTripRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAllOrganizedTrips(
      {required int page,
      required String source,
      required String tab,
      required String startDate,
      required String endDate,
      required double startPrice,
      required double endPrice,
      required List<String> types,
      required List<String> countries});

  Future<Either<Failure, Map<String, dynamic>>> getGroupTripDetails({
    required String tripId,
  });
  Future<Either<Failure, Map<String, dynamic>>> getAllCountries();
}
