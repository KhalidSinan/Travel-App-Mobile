import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';

class HotelForDestinationModel {
  final String destination;
  final String hotelName;
  final String hotelId;
  final String hotelImage;
  final String hotelLocation;
  final int hotelStars;
  final double distanceFromCityCenter;
  final List<RoomCartModel> rooms;
  final String startDate;
  final int numDays;
  final double totalPrice;

  HotelForDestinationModel({
    required this.destination,
    required this.hotelName,
    required this.hotelId,
    required this.hotelImage,
    required this.rooms,
    required this.startDate,
    required this.numDays,
    required this.hotelLocation,
    required this.hotelStars,
    required this.distanceFromCityCenter,
    required this.totalPrice,
  });
}
