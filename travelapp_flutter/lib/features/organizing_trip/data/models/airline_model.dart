class AirlineModel {
  final String name;
  final String logo;
  final String id;

  AirlineModel({required this.name, required this.logo, required this.id});

  factory AirlineModel.fromJson(jsonData) {
    return AirlineModel(
        name: jsonData['name'], logo: jsonData['logo'], id: jsonData['_id']);
  }
}
