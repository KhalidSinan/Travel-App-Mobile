import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/home/data/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getFlightReservations() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/plane-reservations/my-reservations");
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
  Future<Either<Failure, Map<String, dynamic>>> getHotelReservations() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/hotels/my-reservations");
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
  Future<Either<Failure, Map<String, dynamic>>> getHotelReservationDetails(
      {required String id}) async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/hotels/my-reservations/$id");
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
  Future<Either<Failure, Map<String, dynamic>>> getAnnouncements() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/announcements/home");
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
  Future<Either<Failure, Map<String, dynamic>>> getNearbyPlaces() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/places/nearby");
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
  Future<Either<Failure, Map<String, dynamic>>> getMyGroupTrips() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/trips-reservation/");
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
  Future<Either<Failure, Map<String, dynamic>>> getMySingleTrips() async {
    try {
      Map<String, dynamic> response = await apiService.get(endPoint: "/trips/");
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
  Future<Either<Failure, Map<String, dynamic>>> getTimer() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/plane-reservations/nearest");
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
  Future<Either<Failure, Map<String, dynamic>>> getOrganizerTrips() async {
   try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/organized-trips/my");
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
