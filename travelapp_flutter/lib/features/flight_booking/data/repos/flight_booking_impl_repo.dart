import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/two_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_repo.dart';

class FlightBookingImp extends FlightBookingRepo {
  final ApiService apiService;

  FlightBookingImp(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getFlightReservationData(
      {required String id}) async {
    try {
<<<<<<< HEAD
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/flights/reservation/$id", headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MWJhYTgwNGQ1NTA3MjE4YzA4MDBlNiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTMwOTk4NDZ9.y9k9h-gzNgpPSAxsu72SYC5LrOG0cJ8ACRG9P5ZiG4M",
        "Content-Type": "application/json"
      });
=======
      Map<String, dynamic> response = await apiService.get(
        endPoint: "/plane-reservations/$id",
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MmI0MjQxYmEyOGM4MzM3ZjJmYjMyNiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTUyNTExMjl9.y-tbQapdv7HvCOWY24xkDDSYhNy_rcKkaOKaucj58t8',
        },
      );
>>>>>>> Khalid
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
<<<<<<< HEAD
        return left(ServerFailure(errMessage: 'Something went wrong', ));
=======
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> postReservationConfirmation(
      {required String id}) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: "/plane-reservations/confirm",
        body: {
          "id": id,
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: "Something went wrong"));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> cancelReservation({
    required String reserveId,
    required String personId,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/plane-reservations/$reserveId/cancel',
        body: {
          'person_id': personId,
        },
      );
      return right(response);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
>>>>>>> Khalid
      }
    }
  }

  @override
<<<<<<< HEAD
  Future<Either<Failure, List<OneWayFlightModel>>> getAllOneWayFlights({
    required String source,
    required String destination,
    required String date,
    required int seats,
    required String seatsClass,
    String? sortBy,
    String? sort,
    String? timeStart,
    String? timeEnd,
    String? airline,
    String? minPrice,
    String? maxPrice,
    int? page,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/flights/search',
        body: {
          "source": source,
          "destination": destination,
          "date": date,
          "num_of_seats": seats,
          "class_of_seats": seatsClass,
        },
        queryParameters: {
          "limit": flightsInSinglePage,
          "page": page,
          "sortBy": sortBy,
          "sort": sort,
          "time_start": timeStart,
          "time_end": timeEnd,
          "min_price": minPrice,
          "max_price": maxPrice,
          "airline": airline,
        },
      );
      List<OneWayFlightModel> flights = [];
      for (int i = 0; i < response['data'].length; i++) {
        flights.add(OneWayFlightModel.fromJson(response['data'][i]['flight']));
      }
      return right(flights);
=======
  Future<Either<Failure, Map<String, dynamic>>> postRservationConfirmation(
      {required String id}) async {
    try {
      Map<String, dynamic> response =
          await apiService.post(endPoint: "/flights/confirm", body: {
        "id": id,
      });
      return right(response);
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
<<<<<<< HEAD
        print(e.toString());
<<<<<<< HEAD
        return left(ServerFailure(errMessage: 'Something went wrong'));
=======
        return left(ServerFailure(errMessage: "Something went wrong"));
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338
=======
        return left(Failure(errMessage: 'Something went wrong'));
>>>>>>> Khalid
      }
    }
  }

<<<<<<< HEAD
  @override
  Future<Either<Failure, List<TwoWayFlightModel>>> getAllTwoWayFlights({
    required String source,
    required String destination,
    required String date,
    required int seats,
    required String seatsClass,
    required String dateEnd,
    String? sortBy,
    String? sort,
    String? timeStart,
    String? timeEnd,
    String? airline,
    String? minPrice,
    String? maxPrice,
    int? page,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/flights/search',
        body: {
          "source": source,
          "destination": destination,
          "date": date,
          "num_of_seats": seats,
          "class_of_seats": seatsClass,
          "two_way": true,
          "date_end": dateEnd,
        },
        queryParameters: {
          "limit": flightsInSinglePage,
          "page": page,
          "sortBy": sortBy,
          "sort": sort,
          "time_start": timeStart,
          "time_end": timeEnd,
          "min_price": minPrice,
          "max_price": maxPrice,
          "airline": airline,
        },
      );
      List<TwoWayFlightModel> flights = [];
      for (int i = 0; i < response['data'].length; i++) {
        flights.add(TwoWayFlightModel.fromJson(response['data'][i]));
      }
      return right(flights);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        print(e.toString());
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>>
      getCountriesAndAirlines() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MmI0MjQxYmEyOGM4MzM3ZjJmYjMyNiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTUyNTExMjl9.y-tbQapdv7HvCOWY24xkDDSYhNy_rcKkaOKaucj58t8";

    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: "/flights/search",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
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
  Future<Either<Failure, Map<String, dynamic>>> postSearchFlight(
      {required String source,
      required String destination,
      required String date,
      required String? dateEnd,
      required bool twoWay,
      required String classOfSeats,
      required String numOfSeats}) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: "/flights/search",
        body: {
          "source": source,
          "destination": destination,
          "date": date,
          "num_of_seats": numOfSeats,
          "class_of_seats": classOfSeats,
          "two_way": twoWay,
          "date_end": dateEnd
        },
        queryParameters: {
          // "limit": flightsInSinglePage,
          // "page": 1,
        },
      );
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> getFlightDetails(
      {required String id, required String classType, String? idback}) async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: idback == null
            ? "/flights/$id?class=$classType"
            : "/flights/$id?id_back=$idback&class=$classType",
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MmI0MjQxYmEyOGM4MzM3ZjJmYjMyNiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTUyNTExMjl9.y-tbQapdv7HvCOWY24xkDDSYhNy_rcKkaOKaucj58t8',
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        print(e);
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> makeReservation({
    required List<String> flights,
    required List<Map<String, String>> reservations,
    required String reservationType,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/plane-reservations/reserve',
        body: {
          "flights": flights,
          "reservations": reservations,
          "reservation_type": reservationType,
        },
      );
      print(response);
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
=======
 

 

>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338
}

