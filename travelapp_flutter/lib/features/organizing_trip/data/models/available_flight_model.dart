class AvailableFlightModel {
  final String city;
  final String? flight;
  final bool isAvailable;

  AvailableFlightModel(
      {required this.city, required this.flight, required this.isAvailable});

  factory AvailableFlightModel.fromJson(jsonData) {
    return AvailableFlightModel(
        city: jsonData['city'],
        flight: jsonData['flight'],
        isAvailable: jsonData['is_available']);
  }
}
