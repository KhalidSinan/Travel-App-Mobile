import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, Map<String, dynamic>>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  });
  Future<Either<Failure, Map<String, dynamic>>> emailConfirm({
    required String email,
    required String code,
  });
  Future<Either<Failure, Map<String, dynamic>>> googleAuth({
    required String name,
    required String email,
    required String googleId,
    required photoUrl,
  });
  Future<Either<Failure, Map<String, dynamic>>> getProfileData({
    required String token,
  });
  Future<Either<Failure, Map<String, dynamic>>> fogotPassword({
    required String email,
  });
  Future<Either<Failure, Map<String, dynamic>>> resendCode({
    required String email,
  });
  Future<Either<Failure, Map<String, dynamic>>> resetPassword({
    required String newPassword,
    required String newPasswordConfirm,
    required String code,
    required String email,
  });
}
