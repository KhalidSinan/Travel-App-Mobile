class NotifiModel {
  final String notificationTitle;
  final String notificationBody;
  final String createdAt;

  NotifiModel(
      {required this.notificationTitle,
      required this.notificationBody,
      required this.createdAt});

  factory NotifiModel.fromJson(jsonData) {
    return NotifiModel(
        notificationTitle: jsonData['notification_title'],
        notificationBody: jsonData['notification_body'],
        createdAt: jsonData['created_at']);
  }
}
