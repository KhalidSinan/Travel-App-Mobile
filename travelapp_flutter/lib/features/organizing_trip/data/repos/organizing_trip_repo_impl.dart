import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';

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

  @override
  Future<Either<Failure, Map<String, dynamic>>> makeTrip({
    required OrganizingTripCubit trip,
    required List<String> flightsReservations,
    required List<String> hotelsReservations,
  }) async {
    DateTime date = DateFormat('dd/MM/yyyy').parse(trip.startDate!);
    String formattedStartDate = DateFormat('MM-dd-yyyy').format(date);
    List<Map<String, dynamic>> destinations = [];
    for (var destination in trip.destinations) {
      destinations.add({
        "country_name": destination.country,
        "city_name": destination.city,
        "num_of_days": destination.days,
        "activities": trip.getAllPlacesForDestination(
          destination: destination.city,
        ),
      });
    }
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/trips/create',
        body: {
          "overall_num_of_days": trip.numberDays,
          "num_of_people": trip.numberPerson,
          "start_date": formattedStartDate,
          "starting_place": {
            "country": trip.sourceCountry,
            "city": trip.sourceCity,
          },
          "destinations": destinations,
          "flights": flightsReservations,
          "hotels": hotelsReservations,
        },
      );
      print(response);
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
  Future<Either<Failure, Map<String, dynamic>>> getTripSchedule(
      {required String tripId}) async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: '/organized-trips/$tripId/schedule');
      print(response);
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
  Future<Either<Failure, Map<String, dynamic>>> shareTrip(
      {required String tripId}) async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: '/trips/$tripId/share');
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
  Future<Either<Failure, Map<String, dynamic>>> makeGroupTrip({
    required String tripId,
    required int commission,
    required String desc,
    required List<String> types,
  }) async {
    try {
      Map<String, dynamic> response =
          await apiService.post(endPoint: '/organized-trips/create', body: {
        "trip_id": tripId,
        "commission": commission.toInt(),
        "type_of_trip": types,
        "description": desc,
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
