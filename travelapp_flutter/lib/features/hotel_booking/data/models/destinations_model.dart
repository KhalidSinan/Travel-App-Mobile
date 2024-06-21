import 'package:travelapp_flutter/features/hotel_booking/data/models/next_destination_model.dart';

class DestinationsModel {
  final List<NextDestinationModel>? nextDestinations;
  final bool availableTrips;

  DestinationsModel({
    required this.nextDestinations,
    required this.availableTrips,
  });

  factory DestinationsModel.fromJson(jsonData) {
    List<NextDestinationModel>? nextDestinations;
    if (jsonData['data'] != null) {
      nextDestinations = [];
      for (int i = 0; i < jsonData['data'].length; i++) {
        nextDestinations
            .add(NextDestinationModel.fromJson(jsonData['data'][i]));
      }
    }
    return DestinationsModel(
      nextDestinations: nextDestinations!,
      availableTrips: jsonData['available_trips'],
    );
  }
}
