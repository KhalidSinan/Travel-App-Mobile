import 'package:travelapp_flutter/features/hotel_booking/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/filtering_model.dart';

class DestinationsModel {
  final String city;
  final String days;
  final FilterModel filter;

  DestinationsModel(
      {required this.city, required this.days, required this.filter});

  // factory DestinationsModel.fromJson(jsonData) {
  //   return DestinationsModel(
  //       city: jsonData['city'],
  //       days: jsonData["days"],
  //       filter: jsonData['filter']);
  // }
}
