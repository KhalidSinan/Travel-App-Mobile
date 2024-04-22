class DateInfo {
  final String date;
  final String time;

  DateInfo({required this.date, required this.time});

  factory DateInfo.fromJson(jsonData) {
    return DateInfo(
        date: jsonData['date'],
        time: jsonData['time']);
  }
}
