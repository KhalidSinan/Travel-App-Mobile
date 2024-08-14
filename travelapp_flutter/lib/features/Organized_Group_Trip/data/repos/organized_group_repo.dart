import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';

abstract class OrganizingGroupTripRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAllOrganizedTrips(
      {required int page,
      required String source,
      required String tab,
      required String startDate,
      required String endDate,
      required double startPrice,
      required double endPrice,
      required List<String> types,
      required List<String> countries});

  Future<Either<Failure, Map<String, dynamic>>> getGroupTripDetails({
    required String tripId,
  });
  Future<Either<Failure, Map<String, dynamic>>> getAllCountries();

  Future<Either<Failure, Map<String, dynamic>>> reserveGroupTrip({
    required String tripId,
    required int numOfParticipants,
    required List<PassengerModel> participants,
  });
  Future<Either<Failure, Map<String, dynamic>>> getTripParticipantsOrganizer({
    required String tripId,
  });
  Future<Either<Failure, Map<String, dynamic>>> getTripParticipantsUser({
    required String tripId,
  });
  Future<Either<Failure, Map<String, dynamic>>> cancelGroupTripReservation({
    required String tripId,
    required String mainReservationId,
    required List<String> participantsId,
  });
  Future<Either<Failure, Map<String, dynamic>>> cancelGroupTrip({
    required String tripId,
  });
}
