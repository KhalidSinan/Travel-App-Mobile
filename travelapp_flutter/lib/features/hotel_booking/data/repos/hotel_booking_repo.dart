import 'package:dartz/dartz.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class HotelBookingRepo {
  Future<Either<Failure, Map<String, dynamic>>> getAllHotelData({
    required String namecityOrhotelName,
    String? startdate,
    int? numDays,
    int? numRooms,
    int? page,
    String? sortField,
    String? order,
    double? starsNumber,
  });

  Future<Either<Failure, Map<String, dynamic>>> makeHotelReservation(
      {required String hotelId,
      required List<Map<String, dynamic>> roomCodes,
      required String startDate,
      required String numDays});

  Future<Either<Failure, Map<String, dynamic>>> getNextDestination();
}
