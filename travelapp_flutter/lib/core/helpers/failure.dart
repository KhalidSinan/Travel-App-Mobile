import 'package:dio/dio.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  final String errMessage;

  ServerFailure({required this.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure(
            errMessage: dioException.response!.data['message']);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'No internet connection');
    }
  }
}
