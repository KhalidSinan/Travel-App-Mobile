import 'package:travelapp_flutter/features/hotel_booking/data/models/hotelModel.dart';

class AllHotelModel {
  final int totalHotels;
  final List<HotelModel> hotels;

  AllHotelModel({required this.totalHotels, required this.hotels});

  factory AllHotelModel.fromJson(jsonData) {
    List<HotelModel>? hotels;
    if (jsonData['hotels'] != null) {
      hotels = [];
      for (int i = 0; i < jsonData['hotels'].length; i++) {
        hotels.add(HotelModel.fromJson(jsonData['hotels'][i]));
      }
    }
    return AllHotelModel(
        totalHotels: jsonData['totalHotelsFound'], hotels: hotels!);
  }
}
