import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;
  String? token ;
  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/auth/login',
        body: {
          'email': email,
          'password': password,
        },
      );
      token = response['token'];
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: 'something serious went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/auth/register',
        body: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(Failure.fromDioException(e, RegisterStatusCodeHandler()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> emailConfirm({
    required String email,
    required String code,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/auth/confirm-email',
        body: {
          "token": code,
          "email": email,
        },
      );
      token = response['token'];
      final prefs = getIt.get<SharedPreferences>();
      await prefs.setString(tokenKey, token!);
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
  Future<Either<Failure, Map<String, dynamic>>> googleAuth({
    required String name,
    required String email,
    required String googleId,
    required photoUrl,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/auth/google-signin',
        body: {
          "name": name,
          "email": email,
          "google_id": googleId,
          "photo_url": photoUrl,
        },
      );
      return right(response);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProfileData({
    required String token,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: '/users/profile',
        headers: {
          "Authorization": 'Bearer $token',
        },
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> fogotPassword({
    required String email,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/auth/forgot-password',
        body: {
          "email": email,
        },
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
  Future<Either<Failure, Map<String, dynamic>>> resetPassword({
    required String newPassword,
    required String newPasswordConfirm,
    required String code,
    required String email,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/auth/reset-password',
        body: {
          "email": email,
          "token": code,
          "password": newPassword,
          "confirm_password": newPasswordConfirm,
        },
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

  void add() {
    token = null;
  }
}
