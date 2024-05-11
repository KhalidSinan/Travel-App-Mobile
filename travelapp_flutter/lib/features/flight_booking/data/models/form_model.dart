import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';

class FormModel {
  final String userId;
  final List<dynamic> flights;
  int seats;
  final List<PassengerModel>? reservations;
  final double overallPrice;
  final String reservationType;
  final bool isConfirmed;
  final String id;

  FormModel({
    required this.flights,
    required this.reservations,
    required this.isConfirmed,
    required this.seats,
    required this.overallPrice,
    required this.reservationType,
    required this.userId,
    required this.id,
  });
  factory FormModel.fromJson(jsonData) {
    List<PassengerModel>? reservations;
    if (jsonData['reservations']['data'] != null) {
      reservations = [];
      for (int i = 0; i < jsonData['reservations']['data'].length; i++) {
        reservations
            .add(PassengerModel.fromJson(jsonData['reservations']['data'][i]));
        print(reservations[i]);
      }
    }
    return FormModel(
      userId: jsonData['user_id'],
      flights: jsonData['flights'],
      seats: jsonData['num_of_reservations'],
      reservations: reservations!,
      overallPrice: jsonData['overall_price'],
      reservationType: jsonData['reservation_type'],
      isConfirmed: jsonData['is_confirmed'],
      id: jsonData['_id'],
    );
  }
}
