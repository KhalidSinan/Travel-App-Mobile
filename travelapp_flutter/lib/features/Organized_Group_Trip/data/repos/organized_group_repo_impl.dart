import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo.dart';

class OrganizingGroupTripImpl extends OrganizingGroupTripRepo {
  final ApiService apiService;

  OrganizingGroupTripImpl(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllOrganizedTrips({
    required int page,
    required String source,
    required String tab,
    required String startDate,
    required String endDate,
    required double startPrice,
    required double endPrice,
    required List<String> types,
    required List<String> countries,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        "starting_country": source,
        "filterType": types,
        "filterPrice": {
          "start_price": startPrice,
          "end_price": endPrice,
        },
        "filterDate": {
          "start_date": startDate,
          "end_date": endDate,
        },
        "filterDestinations": countries,
        "organizedTripsShown": tab,
      };

      Map<String, dynamic> response = await apiService.post(
        endPoint: "/organized-trips/?page=$page",
        body: requestBody,
      );

      // Debugging print statements
      print("Request body: $requestBody");
      print("Response: $response");

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
  Future<Either<Failure, Map<String, dynamic>>> getAllCountries() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/organized-trips/countries");
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
  Future<Either<Failure, Map<String, dynamic>>> getGroupTripDetails(
      {required String tripId}) async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: '/organized-trips/$tripId');
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
