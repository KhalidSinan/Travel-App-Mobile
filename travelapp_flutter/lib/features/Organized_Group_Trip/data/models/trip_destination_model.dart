import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';

import '../../../flight_booking/data/models/country_model.dart';

class TripDestinationModel {
  final CountryModel destination;
  final String startDate;
  final String endDate;
  final int days;
  final OneWayFlightModel ticket;
  final HotelModel hotel;
  final double price;

  TripDestinationModel({
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.ticket,
    required this.hotel,
    required this.price,
  });

  factory TripDestinationModel.fromJson(jsonData) {
    return TripDestinationModel(
      destination: CountryModel.fromJson(jsonData['destination']),
      startDate: jsonData['start_date'],
      endDate: jsonData['end_date'],
      days: jsonData['num_of_days'],
      ticket: OneWayFlightModel.fromJson(jsonData['ticket']),
      hotel: HotelModel.fromJson(jsonData['hotel']),
      price: jsonData['overall_price'],
    );
  }
}
