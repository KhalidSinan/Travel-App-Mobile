import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class AnnouncementsRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAnnouncementsOptions({
    required String tripId,
  });
  Future<Either<Failure, Map<String, dynamic>>> makeAnnouncement({
    required String tripId,
    required int duration,
    required String location,
    String? title,
    String? body,
  });
}
