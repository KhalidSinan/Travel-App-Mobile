class DateModel {
  final String date;
  final String? time;

  DateModel({required this.date, required this.time});

  factory DateModel.fromJson(jsonData) {
    return DateModel(date: jsonData['date'], time: jsonData['time']);
  }
}
