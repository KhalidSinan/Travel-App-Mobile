import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class StatusCodeHandler {
  Failure handleError(int statusCode, dynamic data);
}

class DefaultStatusCodeHandler extends StatusCodeHandler {
  @override
  Failure handleError(int statusCode, data) {
    data = json.decode(data.toString());
    if (statusCode == 404) {
      print(statusCode);
      print(data.toString());
      return Failure(
        errTitle: 'Error',
        errMessage: data.toString(),
        errType: DioExceptionType.badResponse,
      );
    } else if (statusCode == 400 || statusCode == 401) {
      dynamic message;
      if (data.data is Map<String, dynamic>) {
        final dataMap = data.data as Map<String, dynamic>;
        message = dataMap['message'] ?? 'An error occurred';
      } else {
        message = 'An error occurred!';
        print(statusCode);
        print(data.data);
      }
      return Failure(
        errMessage: message,
        errTitle: 'Error',
        errType: DioExceptionType.badResponse,
      );
    } else {
      print(statusCode);
      return Failure(
        errTitle: 'Error',
        errMessage: data['message'],
        errType: DioExceptionType.badResponse,
      );
    }
  }
}

class RegisterStatusCodeHandler extends StatusCodeHandler {
  @override
  Failure handleError(int statusCode, data) {
    Map<String, dynamic> errors = data['errors'];
    if (statusCode == 500) {
      return Failure(
        errTitle: errors.keys.first,
        errMessage: errors['email'],
      );
    } else {
      return Failure(
        errTitle: errors.keys.first,
        errMessage: errors[errors.keys.first][0],
      );
    }
  }
}

class ReservationHotelStatusCodeHandler extends StatusCodeHandler {
  @override
  Failure handleError(int statusCode, data) {
    print(data);
    List<Map<String, dynamic>> problems = data['problems'];
    String message = data['message'];

    return Failure(
      errMessage: problems,
      errTitle: message,
      errType: DioExceptionType.badResponse,
    );
  }
}

<<<<<<< HEAD
class BecomeOrganizerStatusCodeHandler extends StatusCodeHandler {
  @override
  Failure handleError(int statusCode, data) {
    dynamic message;
    if (data.data is Map<String, dynamic>) {
      final dataMap = data.data as Map<String, dynamic>;
      message = dataMap['message'] ?? 'An error occurred';
    } else {
      message = 'An error occurred';
    }
    return Failure(
      errMessage: message,
      errTitle: 'Error',
=======
class CreateChatStatusCodeHandler extends StatusCodeHandler {
  @override
  Failure handleError(int statusCode, data) {
    data = json.decode(data.toString());
    return Failure(
      errTitle: 'Error',
      errMessage: data['message'],
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
      errType: DioExceptionType.badResponse,
    );
  }
}

<<<<<<< HEAD
// class ChangePsswordStatusCodeHandler extends StatusCodeHandler {
//   @override
//   Failure handleError(int statusCode, data) {
//     dynamic message;
//     if (data.data is Map<String, dynamic>) {
//       final dataMap = data.data as Map<String, dynamic>;
//        message =
//           dataMap['message'] ?? 'An error occurred'; 
//     } else {
//       message = 'An error occurred'; 
//     }
//     return Failure(
//       errMessage: message,
//       errTitle: 'Error',
//       errType: DioExceptionType.badResponse,
//     );
//   }
// }
=======
class SubscribeGroupTripStatusCodeHandler extends StatusCodeHandler {
  @override
  Failure handleError(int statusCode, data) {
    data = json.decode(data.toString());
    return Failure(
      errTitle: 'Error',
      errMessage: data['message'],
      errType: DioExceptionType.badResponse,
    );
  }
}
<<<<<<< HEAD

class DeleteGroupTripStatusCodeHandler extends StatusCodeHandler {
  @override
  Failure handleError(int statusCode, data) {
    data = json.decode(data.toString());
    return Failure(
      errTitle: 'Error',
      errMessage: data['message'],
      errType: DioExceptionType.badResponse,
    );
  }
}
=======
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
>>>>>>> 2c44f886ba263ab71a8c6d9cf8f90252042a60ea
