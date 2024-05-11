import 'package:dio/dio.dart';
<<<<<<< HEAD
import 'package:travelapp_flutter/core/utils/constants.dart';
=======
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
// import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
// import 'package:travelapp_flutter/core/utils/constants.dart';
>>>>>>> Khalid

// class Failure {

<<<<<<< HEAD
class ServerFailure extends Failure {
  final String errMessage;
  final DioExceptionType ?errType;
  ServerFailure({required this.errMessage,  this.errType});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            errMessage: kInternetMessage,
            errType: DioExceptionType.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errMessage: kInternetMessage,
            errType: DioExceptionType.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errMessage: kInternetMessage,
            errType: DioExceptionType.receiveTimeout);
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errMessage: kWrongMessage,
          errType: DioExceptionType.badCertificate,
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response!.statusCode,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: kWrongMessage, errType: DioExceptionType.cancel);
      case DioExceptionType.connectionError:
        return ServerFailure(
            errMessage: kInternetMessage,
            errType: DioExceptionType.connectionError);
      case DioExceptionType.unknown:
        return ServerFailure(
            errMessage: kInternetMessage,
            errType: DioExceptionType.connectionError);
    }
  }

  factory ServerFailure.fromBadResponse(int? statusCode, dynamic data) {
    if (statusCode == 404) {
      return ServerFailure(
          errMessage: data, errType: DioExceptionType.badResponse);
    } else {
      return ServerFailure(
          errMessage: data['message'], errType: DioExceptionType.badResponse);
    }
  }
}

class RegisterFailure extends Failure {
  final String errMessage;
=======
// }

class Failure {
>>>>>>> Khalid
  final String? errTitle;
  final String errMessage;
  final DioExceptionType? errType;
  final StatusCodeHandler? handler;

  Failure({
    required this.errMessage,
    this.errTitle,
    this.errType,
    this.handler,
  });

  factory Failure.fromDioException(
    DioException dioException,
    StatusCodeHandler handler,
  ) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return Failure(
          errTitle: 'Error',
          errMessage: kInternetMessage,
          errType: dioException.type,
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
        return Failure(
          errTitle: 'Error',
          errMessage: kWrongMessage,
          errType: dioException.type,
        );
      case DioExceptionType.badResponse:
        return handler.handleError(
          dioException.response!.statusCode!,
          dioException.response,
        );
    }
  }
}

// class Failure extends Failure {
//   @override
//   final String errMessage;
//   @override
//   final String? errTitle;

//   Failure({
//     required this.errMessage,
//     this.errTitle,
//   });

//   factory Failure.fromDioException(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         return Failure(errMessage: 'Register Connection timeout');
//       case DioExceptionType.sendTimeout:
//         return Failure(errMessage: 'Register Send timeout');
//       case DioExceptionType.receiveTimeout:
//         return Failure(errMessage: 'Register Receive timeout');
//       case DioExceptionType.badCertificate:
//         return Failure(errMessage: 'Register Bad Certificate');
//       case DioExceptionType.badResponse:
//         return Failure.fromBadResponse(
//           dioException.response!.statusCode,
//           dioException.response!.data,
//         );
//       case DioExceptionType.cancel:
//         return Failure(errMessage: 'Register Request canceled');
//       case DioExceptionType.connectionError:
//         return Failure(errMessage: 'No internet connection');
//       case DioExceptionType.unknown:
//         return Failure(errMessage: 'No internet connection');
//     }
//   }
//   factory Failure.fromBadResponse(int? statusCode, dynamic data) {
//     Map<String, dynamic> errors = data['errors'];
//     if (statusCode == 500) {
//       return Failure(
//         errMessage: errors['email'],
//         errTitle: errors.keys.first,
//       );
//     } else {
//       return Failure(
//         errMessage: errors[errors.keys.first][0],
//         errTitle: errors.keys.first,
//       );
//     }
//   }
// }

// class Failure extends Failure {
//   @override
//   final String errMessage;
//   @override
//   final String? errTitle;

//   Failure({
//     required this.errMessage,
//     this.errTitle,
//   });

//   factory Failure.fromDioException(DioException dioException) {
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         return Failure(errMessage: 'Login Connection timeout');
//       case DioExceptionType.sendTimeout:
//         return Failure(errMessage: 'Login Send timeout');
//       case DioExceptionType.receiveTimeout:
//         return Failure(errMessage: 'Login Receive timeout');
//       case DioExceptionType.badCertificate:
//         return Failure(errMessage: 'Login Bad Certificate');
//       case DioExceptionType.badResponse:
//         return Failure(errMessage: dioException.response!.data['message']);
//       case DioExceptionType.cancel:
//         return Failure(errMessage: 'Login Request canceled');
//       case DioExceptionType.connectionError:
//         return Failure(errMessage: 'No internet connection');
//       case DioExceptionType.unknown:
//         return Failure(errMessage: 'No internet connection');
//     }
//   }
// }
