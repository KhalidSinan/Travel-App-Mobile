import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class OrganizerReportRepo {
  Future<Either<Failure, Map<String, dynamic>>> getOrganizersForReport();
  Future<Either<Failure, Map<String, dynamic>>> reportOrganizer({
    required String organizerId,
    required String title,
    required String message,
  });
  Future<Either<Failure, Map<String, dynamic>>> reviewOrganizer({
    required String tripId,
    required int rate,
  });
}
