import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_repo.dart';

class HotelBookingImp extends HotelBookingRepo {
  final ApiService apiService;

  HotelBookingImp(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllHotelData(
      {required String namecityOrhotelName,
      String? startdate,
      int? numDays,
      int? numRooms,
      int? page,
      String? sortField,
      String? order,
      int? starsNumber}) async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/hotels/search", extra: {
        "nameOrCity": "Berlin",
        "startData": "22/5/2024",
        "numDays": 3,
        "numRooms": 44,
        "page": 1,
        "sortField": sortField,
        "order": order,
        "stars": starsNumber,
      });
      return right(response);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }
}
