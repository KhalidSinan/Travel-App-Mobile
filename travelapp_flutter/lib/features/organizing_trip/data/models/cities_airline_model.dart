class CountryModel {
  final String countryName;
  final List<String> cities;

  CountryModel({required this.countryName, required this.cities});

  factory CountryModel.fromJson(jsonData) {
    return CountryModel(
        countryName: jsonData["name"],
        cities: List<String>.from(jsonData['cities']));
  }
}
