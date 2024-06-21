class NextDestinationModel {
  final String city;
  final String date;

  NextDestinationModel({
    required this.city,
    required this.date,
  });

  factory NextDestinationModel.fromJson(jsonData) {
    return NextDestinationModel(
      city: jsonData['city'],
      date: jsonData['date2'],
    );
  }
}
