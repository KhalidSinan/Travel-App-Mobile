import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo.dart';

class SettingsRepoImpl extends SettingsRepo {
  final ApiService apiService;

  SettingsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCities() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/hotels/cities");
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserData() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/users/profile");
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> changeLocation(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.put(endPoint: "/users/location", body: body);
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> changeName(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.put(endPoint: "/users/name", body: body);
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> changeNumber(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.put(endPoint: "/users/phone-number", body: body);
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> changeDate(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.put(endPoint: "/users/date", body: body);
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> setGender(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.put(endPoint: "/users/gender", body: body);
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> changeImage(
      {required dynamic body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.put(endPoint: "/users/profile-pic", body: body);
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> becomeOrganizer(
      {required dynamic body}) async {
    try {
      Map<String, dynamic> response = await apiService.post(
          endPoint: "/users/become-organizer", body: body);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, BecomeOrganizerStatusCodeHandler()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> changePassword(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.put(endPoint: "/users/password", body: body);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> checkPassword(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response = await apiService.post(
          endPoint: "/users/request-delete-account", body: body);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> deleteAccount(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response = await apiService.delete(
        endPoint: "/users/delete-account",
        body: body,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> reportAnBug(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.post(endPoint: "/reports/app", body: body);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> ratingApp(
      {required Map<String, dynamic> body}) async {
    try {
      Map<String, dynamic> response =
          await apiService.post(endPoint: "/ratings", body: body);
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllNotifications() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: '/notifications');
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }
}
