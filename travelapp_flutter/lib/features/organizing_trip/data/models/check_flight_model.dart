import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';

class CheckFlightModel {
  final String source;
  final List<DestinationsModel> destinations;
  final String startDate;
  final String classOfSeat;
  final bool? isReturn;
  final int daysTrip;

  CheckFlightModel(
      {required this.source,
      required this.destinations,
      required this.classOfSeat,
      required this.isReturn,
      required this.daysTrip,
      required this.startDate});

  // Map<String, dynamic> toJson() {
  //   return {
  //     "source": source,
  //     "destinations": destinations,
  //     //need to continue

  //     "class_of_seats": classOfSeat,
  //     "is_return": isReturn
  //   };
  // }
}
