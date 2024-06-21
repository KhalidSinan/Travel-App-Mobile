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
      double? starsNumber}) async {
    try {
      print(page);
      //print(starsNumber);
      Map<String, dynamic> response = await apiService.post(
        endPoint: "/hotels/search",
        body: {
          "nameOrCity": namecityOrhotelName,
          "startDate": startdate,
          "numDays": 1,
          "numRooms": 1,
          "page": page ?? 1,
          "sortField": sortField,
          "order": order,
          "stars": starsNumber,
        },
      );
      print('response is : $response');
      return right(response);
    } catch (e) {
      print('e : $e');
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> makeHotelReservation({
    required String hotelId,
    required List<Map<String,dynamic>> roomCodes,
    required String startDate,
    required String numDays,
  }) async {
    try {

      Map<String, dynamic> response = await apiService.post(
        endPoint: "/hotels/reserve",
        body: {
          "hotelId": hotelId,
          "roomCodes": roomCodes,
          "startDate": startDate,
          "numDays": int.parse(numDays),
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(Failure.fromDioException(e, DefaultStatusCodeHandler()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getNextDestination() async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: "/plane-reservations/next-destination",
      );
      print(response);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }
}
