import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_repo.dart';

class FlightBookingImp extends FlightBookingRepo {
  final ApiService apiService;

  FlightBookingImp(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getFlightReservationData(
      {required String id}) async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/flights/reservation/$id", headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MWJhYTgwNGQ1NTA3MjE4YzA4MDBlNiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTMwOTk4NDZ9.y9k9h-gzNgpPSAxsu72SYC5LrOG0cJ8ACRG9P5ZiG4M",
        "Content-Type": "application/json"
      });
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errMessage: 'Something went wrong', ));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> postRservationConfirmation(
      {required String id}) async {
    try {
      Map<String, dynamic> response =
          await apiService.post(endPoint: "/flights/confirm", body: {
        "id": id,
      });
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errMessage: "Something went wrong"));
      }
    }
  }

 

 

}

