import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_for_destination_model.dart';

class HotelReservationModel {
  List<HotelForDestinationModel?> hotels;
  double totalPrice;

  HotelReservationModel({required this.hotels, required this.totalPrice});

  double getAllHotelsPrice() {
    double totalPrice = 0;
    for (var hotel in hotels) {
      totalPrice += hotel!.totalPrice;
    }
    return totalPrice;
  }
}
