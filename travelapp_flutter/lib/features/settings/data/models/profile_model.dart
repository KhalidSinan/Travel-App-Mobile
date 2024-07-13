import 'package:travelapp_flutter/features/settings/data/models/location_model.dart';
import 'package:travelapp_flutter/features/settings/data/models/name_model.dart';
import 'package:travelapp_flutter/features/settings/data/models/number_model.dart';

class ProfileModel {
  final String email;
  final String? gender;
  final String? birthDate;
  final String? photo;
  final bool guide;
  final NameModel name;
  final LocationModel location;
  final NumberModel? number;

  ProfileModel({
    required this.email,
    required this.gender,
    required this.birthDate,
    required this.number,
    required this.photo,
    required this.guide,
    required this.name,
    required this.location,
  });

  factory ProfileModel.fromJson(jsonData) {
    return ProfileModel(
      email: jsonData['email'],
      gender: jsonData['gender'],
      birthDate: jsonData['date_of_birth'],
      number: jsonData['phone_number'] != null
          ? NumberModel.fromJson(jsonData['phone_number'])
          : null,
      photo: jsonData['profile_pic'],
      guide: jsonData['is_organizer'],
      name: NameModel.fromJson(jsonData['name']),
      location: LocationModel.fromJson(jsonData['location']),
    );
  }
}
