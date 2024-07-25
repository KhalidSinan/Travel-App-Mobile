import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class SettingsRepo {
  Future<Either<Failure, Map<String, dynamic>>> getCities();

  Future<Either<Failure, Map<String, dynamic>>> getUserData();

  Future<Either<Failure, Map<String, dynamic>>> changeLocation(
      {required Map<String, dynamic> body});

  Future<Either<Failure, Map<String, dynamic>>> changeNumber(
      {required Map<String, dynamic> body});

  Future<Either<Failure, Map<String, dynamic>>> changeName(
      {required Map<String, dynamic> body});

  Future<Either<Failure, Map<String, dynamic>>> setGender(
      {required Map<String, dynamic> body});

  Future<Either<Failure, Map<String, dynamic>>> changeDate(
      {required Map<String, dynamic> body});

  Future<Either<Failure, Map<String, dynamic>>> changeImage(
      {required dynamic body});
}
