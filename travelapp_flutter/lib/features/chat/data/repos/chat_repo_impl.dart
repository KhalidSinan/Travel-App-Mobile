import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo.dart';

class ChatImplRepo extends ChatRepo {
  final ApiService apiService;
  ChatImplRepo(this.apiService);

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

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllChats({
    required int page,
    String? type,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: '/chats?page=$page&type=$type',
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllJoinableChats(
      {required int page}) async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: '/chats/joinable?page=$page',
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> joinChat({
    required String chatId,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: '/chats/$chatId/join',
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }
}
