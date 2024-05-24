import 'package:travelapp_flutter/features/hotel_booking/data/models/locationModel.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/roomModel.dart';
class HotelModel {
  final String id;
  final String name;
  final LocationModel location;
  final int stars;
  final String description;
  final List<RoomTypeModel> roomType;
  final int roomsNumber;
  final double distanceFromCityCenter;
  final List<String> images;
  final int v;
  HotelModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.stars,
      required this.description,
      required this.roomType,
      required this.roomsNumber,
      required this.distanceFromCityCenter,
      required this.images,
      required this.v});
  factory HotelModel.fromJson(jsonData) {
    List<RoomTypeModel>? roomTypes;
    if (jsonData['room_types'] != null) {
      roomTypes = [];
      for (int i = 0; i < jsonData['room_types'].length; i++) {
        roomTypes.add(RoomTypeModel.fromJson(jsonData['room_types'][i]));
      }
    }
    return HotelModel(
        id: jsonData["_id"],
        name: jsonData["name"],
        location: LocationModel.fromJson(jsonData["location"]),
        stars: jsonData["stars"],
        description: jsonData["description"],
        roomType: roomTypes!,
        roomsNumber: jsonData["rooms_number"],
        distanceFromCityCenter: jsonData["distance_from_city_center"],
        images: List<String>.from(jsonData["images"]),
        v: jsonData["__v"]);
  }
}
