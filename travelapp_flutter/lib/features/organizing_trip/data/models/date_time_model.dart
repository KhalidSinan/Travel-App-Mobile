class Date {
  final String date;
  final String time;

  Date({required this.date, required this.time});

  factory Date.fromJson(jsonData) {
    return Date(date: jsonData['date'], time: jsonData['time']);
  }
}
