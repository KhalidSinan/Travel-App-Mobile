class LocationModel {
  final String? name;
  final String? city;
  final String? country;
  final String? id;

  LocationModel(
      {required this.name,
      required this.city,
      required this.country,
      required this.id});

  factory LocationModel.fromJson(jsondata) {
    return LocationModel(
        name: jsondata['name'],
        city: jsondata['city'],
        country: jsondata['country'],
        id: jsondata['_id']);
  }
}
