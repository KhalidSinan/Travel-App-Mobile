import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ChatRepo {
  Future<Either<Failure, Map<String, dynamic>>> createChatForTrip({
    required String tripId,
    required String groupName,
  });

  Future<Either<Failure, Map<String, dynamic>>> getAllChats({
    required int page,
    String? type,
  });

  Future<Either<Failure, Map<String, dynamic>>> getAllJoinableChats(
      {required int page});

        Future<Either<Failure, Map<String, dynamic>>> joinChat({
    required String chatId,
  });
}
