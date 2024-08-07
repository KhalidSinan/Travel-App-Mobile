import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ChatRepo {
  Future<Either<Failure, Map<String, dynamic>>> createChatForTrip({
    required String tripId,
    required String groupName,
  });
}
