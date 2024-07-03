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
          await apiService.get(endPoint: "/flights/cities");
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
  Future<Either<Failure, Map<String, dynamic>>> checkFlightsForTrip({
    required String source,
    required bool isReturn,
    required List<Map<String, dynamic>> destinations,
    required String classType,
    required int daysTrip,
    required int numPersons,
    required String startDate,
  }) async {
    try {
      Map<String, dynamic> response =
          await apiService.post(endPoint: "/flights/options", body: {
        "source": source,
        "destinations": destinations,
        "start_date": startDate,
        "num_of_seats": numPersons,
        "class_of_seats": classType,
        "is_return": isReturn,
        "num_of_days": daysTrip,
      });
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: "something went wrong"));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getPlaces(
      {required String city, required String category}) async {
    try {
      Map<String, dynamic> response = await apiService.get(
          endPoint: "/places/city?city=$city&category=$category");
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
