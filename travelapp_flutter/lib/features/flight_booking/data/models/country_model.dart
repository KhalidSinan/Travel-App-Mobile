class CountryModel {
  final String name;
  final String city;
  final String country;

  CountryModel({required this.name, required this.city, required this.country});

  factory CountryModel.fromJson(jsonData) {
    return CountryModel(
        name: jsonData['name'],
        city: jsonData['city'],
        country: jsonData['country']);
  }
}
