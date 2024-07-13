class LocationModel {
  final String? country;
  final String? city;

  LocationModel({
    required this.country,
    required this.city,
  });

  factory LocationModel.fromJson(jsonData) {
    return LocationModel(
      city: jsonData['city'],
      country: jsonData['country'],
    );
  }
}
