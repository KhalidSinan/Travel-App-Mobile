<<<<<<< HEAD
import 'package:travelapp_flutter/core/helpers/api_service.dart';
=======
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo.dart';

class ChatImplRepo extends ChatRepo {
  final ApiService apiService;
  ChatImplRepo(this.apiService);
<<<<<<< HEAD
=======

  @override
  Future<Either<Failure, Map<String, dynamic>>> createChatForTrip({
    required String tripId,
    required String groupName,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/chats/$tripId/create',
        body: {
          "chat_name": groupName,
        },
      );
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(Failure.fromDioException(e, CreateChatStatusCodeHandler()));
      }
      return left(Failure(errMessage: 'Something Went Wrong'));
    }
  }
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
}
