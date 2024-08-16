import 'package:travelapp_flutter/core/helpers/trip_status.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/trip_destination_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/country_model.dart';

class GroupTripModel {
  final String id;
  final String organizer;
  final CountryModel source;
  final List<TripDestinationModel> destinations;
  final String startDate;
  final String endDate;
  final int days;
  final int overallSeats;
  final int participants;
  final List<String> types;
  final TripStatus status;
  final double price;
  final double priceWithCommission;
  final String description;

  GroupTripModel({
    required this.id,
    required this.organizer,
    required this.source,
    required this.destinations,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.overallSeats,
    required this.participants,
    required this.types,
    required this.status,
    required this.price,
    required this.priceWithCommission,
    required this.description,
  });

  factory GroupTripModel.fromJson(jsonData) {
    List<TripDestinationModel> destinations = [];
    for (var jsonDestination in jsonData['destinations']) {
      print(jsonDestination);
      destinations.add(TripDestinationModel.fromJson(jsonDestination));
    }
    return GroupTripModel(
      id: jsonData['id'],
      organizer: jsonData['organizer_name'],
      source: CountryModel.fromJson(jsonData['source']),
      destinations: destinations,
      startDate: jsonData['start_date'],
      endDate: jsonData['end_date'],
      days: jsonData['num_of_days'],
      overallSeats: jsonData['overall_seats'],
      participants: jsonData['num_of_people_participating'],
      types: List<String>.from(jsonData['trip_type']),
      status: getTripStatus(jsonData['status_of_trip']),
      price: jsonData['price'],
      priceWithCommission: jsonData['price_with_commission'],
      description: jsonData['description'],
    );
  }

  static TripStatus getTripStatus(String status) {
    switch (status) {
      case "On Going":
        return TripStatus.onGoing;
      case "Waiting":
        return TripStatus.waiting;
      case "Finished":
        return TripStatus.finished;
      default:
        return TripStatus.onGoing;
    }
  }
}
