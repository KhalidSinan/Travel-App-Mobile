<<<<<<< HEAD
abstract class ChatRepo {}
=======
import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ChatRepo {
  Future<Either<Failure, Map<String, dynamic>>> createChatForTrip({
    required String tripId,
    required String groupName,
  });
}
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
