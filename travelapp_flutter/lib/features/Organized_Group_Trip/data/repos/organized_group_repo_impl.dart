import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';

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

  @override
  Future<Either<Failure, Map<String, dynamic>>> reserveGroupTrip({
    required String tripId,
    required int numOfParticipants,
    required List<PassengerModel> participants,
  }) async {
    try {
      participants.map((participant) {
        return {
          "name": participant.personName,
          "passport_number": participant.passport,
        };
      }).toList();
      List<Map<String, dynamic>> participantsList =
          participants.map((participant) {
        return {
          "name": participant.personName,
          "passport_number": participant.passport,
        };
      }).toList();
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/trips-reservation/$tripId/reserve',
        body: {
          "num_of_people": numOfParticipants,
          "reservation_data": participantsList
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, SubscribeGroupTripStatusCodeHandler()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getTripParticipantsOrganizer({
    required String tripId,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: '/trips-reservation/$tripId',
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, SubscribeGroupTripStatusCodeHandler()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getTripParticipantsUser({
    required String tripId,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.get(
        endPoint: '/trips-reservation/$tripId/my',
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
  Future<Either<Failure, Map<String, dynamic>>> cancelGroupTripReservation({
    required String tripId,
    required String mainReservationId,
    required List<String> participantsId,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
          endPoint: '/trips-reservation/$tripId/cancel/$mainReservationId',
          body: {
            "reservations": participantsId,
          });
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, DeleteGroupTripStatusCodeHandler()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> joinChat(
      {required String tripId}) async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: '/chats/$tripId/join');
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
  Future<Either<Failure, Map<String, dynamic>>> cancelGroupTrip(
      {required String tripId}) async {
    try {
      Map<String, dynamic> response = await apiService.delete(
        endPoint: '/organized-trips/$tripId',
        body: {},
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, DeleteGroupTripStatusCodeHandler()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }
}
