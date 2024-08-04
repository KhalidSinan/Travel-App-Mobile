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
      {required int page,
      required String source,
      required String tab,
      required String startDate,
      required String endDate}) async {
    try {
      print("0000000000");
      print(tab);
      Map<String, dynamic> response = await apiService
          .post(endPoint: "/organized-trips/?page=$page", body: {
        "starting_country": source,
        "organizedTripsShown": tab,
        "filterDestinations": [],
        "filterType": [],
        "filterDate": {"start_date": startDate, "end_date": endDate},
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
