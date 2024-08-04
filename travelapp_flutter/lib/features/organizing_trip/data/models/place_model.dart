import 'package:travelapp_flutter/features/organizing_trip/data/models/address_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/phone_number_model.dart';

class PlaceModel {
  final String name;
  final String category;
  final String description;
  final PhoneNumberModel phoneNumber;
  final AddressModel address;
  final String id;

  PlaceModel({
    required this.name,
    required this.category,
    required this.description,
    required this.phoneNumber,
    required this.address,
    required this.id,
  });

  factory PlaceModel.fromJson(jsonData) {
    return PlaceModel(
      name: jsonData['name'],
      category: jsonData['category'],
      description: jsonData['description'],
      id: jsonData['_id'],
      phoneNumber: PhoneNumberModel.fromJson(jsonData['phone_number']),
      address: AddressModel.fromJson(jsonData['address']),
    );
  }

  Map<String, String> toJson() {
    return {
      "place": id,
      "description": category,
    };
  }
}
