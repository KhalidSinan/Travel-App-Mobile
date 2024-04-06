import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

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
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(LoginFailure.fromDioException(e));
      } else {
        return left(LoginFailure(errMessage: 'something serious went wrong'));
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
        return left(RegisterFailure.fromDioException(e));
      }
      return left(RegisterFailure(errMessage: 'Something went wrong'));
    }
  }
}
