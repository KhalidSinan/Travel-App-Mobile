import 'package:travelapp_flutter/features/hotel_booking/data/models/destinations_model.dart';

class CheckFlightModel {
  final String source;
  final List<DestinationsModel> destinations;

  final String classOfSeat;
  final bool isReturn;

  CheckFlightModel(
      {required this.source,
      required this.destinations,
      required this.classOfSeat,
      required this.isReturn});

  Map<String, dynamic> toJson() {
    return {
      "source": source,
      "destinations": destinations,
      //need to continue
      
      "class_of_seats": classOfSeat,
      "is_return": isReturn
    };
  }
}
