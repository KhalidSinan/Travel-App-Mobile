class AirlineModel {
  final String name;
  final String logo;

  AirlineModel({required this.name, required this.logo});
  factory AirlineModel.fromJson(jsonData) {
    return AirlineModel(
      name: jsonData['name'],
      logo: jsonData['logo'],
    );
  }
}
