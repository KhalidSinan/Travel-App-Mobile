import 'package:travelapp_flutter/features/hotel_booking/data/models/problem_of_room_model.dart';

class FailHotelReservationModel {
  final String message;
  final List<ProblemOfRoomModel> problems;

  FailHotelReservationModel({required this.message, required this.problems});

  factory FailHotelReservationModel.from(json) {
    List<ProblemOfRoomModel>? problems;
    if (json['problems'] != null) {
      for (int i = 0; i < json['problems'].length; i++) {
        problems = [];
        problems.add(
          ProblemOfRoomModel.from(json['problems'][i]),
        );
      }
    }

    return FailHotelReservationModel(
        message: json['message'], problems: problems!);

  }
}
