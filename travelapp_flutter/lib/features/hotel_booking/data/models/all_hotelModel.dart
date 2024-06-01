
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';

class AllHotelModel {
  final int totalHotels;
  final int currentPage;
  final List<HotelModel> hotels;

  AllHotelModel( {required this.totalHotels, required this.hotels,required this.currentPage,});

  factory AllHotelModel.fromJson(jsonData) {
    List<HotelModel>? hotels;
    if (jsonData['hotels'] != null) {
      hotels = [];
      for (int i = 0; i < jsonData['hotels'].length; i++) {
        hotels.add(HotelModel.fromJson(jsonData['hotels'][i]));
      }
    }
    return AllHotelModel(
        totalHotels: jsonData['totalHotelsFound'], hotels: hotels!, currentPage: jsonData['current_page']);
  }
}
