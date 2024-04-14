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
        print(dioException.response!.data);
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

class RegisterFailure extends Failure {
  final String errMessage;
  final String? errTitle;

  RegisterFailure({
    required this.errMessage,
    this.errTitle,
  });

  factory RegisterFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return RegisterFailure(errMessage: 'Register Connection timeout');
      case DioExceptionType.sendTimeout:
        return RegisterFailure(errMessage: 'Register Send timeout');
      case DioExceptionType.receiveTimeout:
        return RegisterFailure(errMessage: 'Register Receive timeout');
      case DioExceptionType.badCertificate:
        return RegisterFailure(errMessage: 'Register Bad Certificate');
      case DioExceptionType.badResponse:
        return RegisterFailure.fromBadResponse(
          dioException.response!.statusCode,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return RegisterFailure(errMessage: 'Register Request canceled');
      case DioExceptionType.connectionError:
        return RegisterFailure(errMessage: 'No internet connection');
      case DioExceptionType.unknown:
        return RegisterFailure(errMessage: 'No internet connection');
    }
  }
  factory RegisterFailure.fromBadResponse(int? statusCode, dynamic data) {
    Map<String, dynamic> errors = data['errors'];
    if (statusCode == 500) {
      return RegisterFailure(
        errMessage: errors['email'],
        errTitle: errors.keys.first,
      );
    } else {
      return RegisterFailure(
        errMessage: errors[errors.keys.first][0],
        errTitle: errors.keys.first,
      );
    }
  }
}

class LoginFailure extends Failure {
  final String errMessage;
  final String? errTitle;

  LoginFailure({
    required this.errMessage,
    this.errTitle,
  });

  factory LoginFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return LoginFailure(errMessage: 'Login Connection timeout');
      case DioExceptionType.sendTimeout:
        return LoginFailure(errMessage: 'Login Send timeout');
      case DioExceptionType.receiveTimeout:
        return LoginFailure(errMessage: 'Login Receive timeout');
      case DioExceptionType.badCertificate:
        return LoginFailure(errMessage: 'Login Bad Certificate');
      case DioExceptionType.badResponse:
        return LoginFailure(errMessage: dioException.response!.data['message']);
      case DioExceptionType.cancel:
        return LoginFailure(errMessage: 'Login Request canceled');
      case DioExceptionType.connectionError:
        return LoginFailure(errMessage: 'No internet connection');
      case DioExceptionType.unknown:
        return LoginFailure(errMessage: 'No internet connection');
    }
  }
}
