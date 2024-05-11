class RemainingTimeModel {
  final int hours;
  final int days;
  final int minutes;
  final int seconds;

  RemainingTimeModel({
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  factory RemainingTimeModel.fromJson(jsonData) {
    return RemainingTimeModel(
      days: jsonData['days'],
      hours: jsonData['hours'],
      minutes: jsonData['minutes'],
      seconds: jsonData['seconds'],
    );
  }
}
