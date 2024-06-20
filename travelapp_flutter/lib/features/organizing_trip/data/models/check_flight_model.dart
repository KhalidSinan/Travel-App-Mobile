import 'package:travelapp_flutter/features/hotel_booking/data/models/destinations_model.dart';

class CheckFlightModel {
  final String source;
  final List<DestinationsModel> destinations;
  final String startDate;
  final int numOfSeats;
  final String classOfSeat;
  final bool isReturn;

  CheckFlightModel(
      {required this.source,
      required this.destinations,
      required this.startDate,
      required this.numOfSeats,
      required this.classOfSeat,
      required this.isReturn});

  Map<String, dynamic> toJson() {
    return {
      "source": source,
      "destinations": destinations,
      "start_date": startDate,
      "num_of_seats": numOfSeats,
      "class_of_seats": classOfSeat,
      "is_return": isReturn
    };
  }
}
