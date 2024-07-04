import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class SettingsRepo {
 Future<Either<Failure, Map<String, dynamic>>> getCities();
}