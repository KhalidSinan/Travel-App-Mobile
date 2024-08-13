import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';

class RoomCartModel {
  final RoomTypeModel room;
  int count;

  RoomCartModel({required this.room, required this.count});

  factory RoomCartModel.from(json) {
    return RoomCartModel(room: json['room'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {
      "code": room.code,
      "count": count,
    };
  }

  void increaseCount() {
    count++;
  }

  void decreaseCount() {
    count--;
  }
}
