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
    int? starsNumber,
  });
}
