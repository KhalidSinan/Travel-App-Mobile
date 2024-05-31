import 'package:travelapp_flutter/features/hotel_booking/data/models/success_room_reservvation_model.dart';

class SuccessHotelReservationModel {
  final String hotelId;
  final String userId;
  final List<SuccesRoomReservationModel> roomCodes;
  final String startDate;
  final String endDate;
  final double roomPrice;
  final String id;
  final String v;

  SuccessHotelReservationModel(
      {required this.hotelId,
      required this.userId,
      required this.roomCodes,
      required this.startDate,
      required this.endDate,
      required this.roomPrice,
      required this.id,
      required this.v});

  factory SuccessHotelReservationModel.from(json) {
    List<SuccesRoomReservationModel>? roomCodes;
    if (json['room_codes'] != null) {
      for (var i = 0; i < json['room_codes'].length; i++) {
        roomCodes = [];
        roomCodes.add(SuccesRoomReservationModel.from(json['room_codes'][i]));
      }
    }

    return SuccessHotelReservationModel(
        hotelId: json['hotel_id'],
        userId: json['user_id'],
        roomCodes: roomCodes!,
        startDate: json['start_date'],
        endDate: json['end_date'],
        roomPrice: json['room_price'],
        id: json['_id'],
        v: json['__v']);
  }
}


