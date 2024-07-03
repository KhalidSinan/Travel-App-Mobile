import 'package:travelapp_flutter/features/organizing_trip/data/models/filtering_model.dart';
class DestinationsModel {
  final String city;
  final int days;
  final FilterModel? filter;
  DestinationsModel({required this.city, required this.days, this.filter});
  DestinationsModel copyWith({
    String? city,
    int? days,
    FilterModel? filter,
  }) {
    return DestinationsModel(
      city: city ?? this.city,
      days: days ?? this.days,
      filter: filter ?? this.filter,
    );
  }
}
