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
  Future<Either<Failure, Map<String, dynamic>>> getAllOrganizedTrips(
      {required int page}) async {
    try {
      Map<String, dynamic> response = await apiService.post(
          endPoint: "http://localhost:5000/organized-trips/?page=${page}",
          body: {
            "starting_country": "",
            "organizedTripsShown": "All",
            "filterDestinations": [],
            "filterType": [],
            "filterDate": {"start_date": "", "end_date": ""},
            "filterPrice": {"start_price": "", "end_price": ""},
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
}
