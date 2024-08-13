import 'package:travelapp_flutter/core/helpers/convert_class_type.dart';

class PassengerModel {
  final String personName;
  final String? seatClass;
  final String? seatNumber;
  final double? price;
  final String? passport;
  final String? id;

  PassengerModel({
    required this.personName,
    required this.seatClass,
    required this.seatNumber,
    required this.price,
    required this.passport,
    required this.id,
  });

  factory PassengerModel.fromJson(jsonData) {
    return PassengerModel(
        personName: jsonData['person_name'] ?? jsonData['name'],
        seatClass: jsonData['seat_class'],
        seatNumber: jsonData['seat_number'],
        price: jsonData['price'],
        passport: jsonData['person_passport'] ??
            jsonData['passport_number'].toString(),
        id: jsonData['_id'] ?? jsonData['id']);
  }

  Map<String, String> toJson() {
    return {
      "seat_class": getClassType(seatClass!),
      "person_name": personName,
      "person_passport": passport!,
    };
  }
}
