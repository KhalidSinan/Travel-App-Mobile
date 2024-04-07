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
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errMessage: 'something serious went wrong'));
      }
    }
  }

  // @override
  // Future<Either<Failure, Map<String, dynamic>>> register() {}
}
