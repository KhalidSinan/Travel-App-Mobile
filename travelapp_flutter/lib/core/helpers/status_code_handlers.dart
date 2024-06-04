import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class StatusCodeHandler {
  Failure handleError(int statusCode, dynamic data);
}

class DefaultStatusCodeHandler extends StatusCodeHandler {
  @override
  Failure handleError(int statusCode, data) {
    if (statusCode == 404) {
      print(statusCode);
      print(data.toString());
      return Failure(
        errTitle: 'Error',
        errMessage: data,
        errType: DioExceptionType.badResponse,
      );
    } else {
      print(statusCode);
      print(data);
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
    List<Map<String, dynamic>> problems = data['problems'];
    String message = data['message'];

    return Failure(
      errMessage: problems,
      errTitle: message,
      errType: DioExceptionType.badResponse,
    );
  }
}
