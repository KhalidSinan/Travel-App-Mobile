import 'package:travelapp_flutter/features/hotel_booking/data/models/location_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_model.dart';

class HotelModel {
  final String id;
  final String name;
  final LocationModel location;
  final int stars;
  final String description;
  final List<RoomTypeModel> roomType;
  final int? roomsNumber;
  final String distanceFromCityCenter;
  final List<String> images;
  final dynamic startsFrom;

  HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.stars,
    required this.description,
    required this.roomType,
    required this.roomsNumber,
    required this.distanceFromCityCenter,
    required this.images,
    required this.startsFrom,
  });

  factory HotelModel.fromJson(jsonData) {
    List<RoomTypeModel>? roomTypes;
    var rooms = jsonData['room_types'] ?? jsonData['rooms_reserved'];
    if (rooms != null) {
      roomTypes = [];
      for (int i = 0; i < rooms.length; i++) {
        roomTypes.add(RoomTypeModel.fromJson(rooms[i]));
      }
    }
    return HotelModel(
        id: jsonData["_id"] ?? jsonData['hotel_id'],
        name: jsonData["name"] ?? jsonData['hotel_name'],
        location: LocationModel.fromJson(
            jsonData["location"] ?? jsonData['hotel_location']),
        stars: jsonData["stars"] ?? jsonData['hotel_stars'],
        description: jsonData["description"] ?? jsonData['hotel_description'],
        roomType: roomTypes!,
        roomsNumber: jsonData["rooms_number"],
        distanceFromCityCenter:
            jsonData["distance_from_city_center"].toString(),
        images: List<String>.from(jsonData["images"] ?? [jsonData['image']]),
        startsFrom: jsonData["starts_from"] ?? jsonData['price']);
  }
}
