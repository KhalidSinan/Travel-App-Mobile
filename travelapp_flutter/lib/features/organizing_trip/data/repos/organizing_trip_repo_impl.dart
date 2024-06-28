import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo.dart';

class OrganizingTripImpl extends OrganizingTripRepo {
  final ApiService apiService;

  OrganizingTripImpl(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCitiesAndAirlines() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/flights/cities", headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NzJkOWU4ZmQ5ZjMwM2QxZjQwN2Y5MCIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTg5NTI4MjB9.BsY3vDEIQ00BbjX-6ImkT1v5w17TRXHE2cH8W1GUm3I",
      });
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
}
