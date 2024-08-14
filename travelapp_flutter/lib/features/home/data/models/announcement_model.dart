class AnnouncementModel {
  final String id;
  final String title;
  final String body;
  final String tripId;
  final bool organizer;
  final String? organizerId;
  final String? organizerName;
  final String date;

  AnnouncementModel({
    required this.title,
    required this.body,
    required this.tripId,
    required this.organizerId,
    required this.organizer,
    required this.date,
    required this.id,
    required this.organizerName,
  });

  factory AnnouncementModel.fromJson(jsonData) {
    return AnnouncementModel(
      title: jsonData['announcement_title'],
      body: jsonData['announcement_body'],
      tripId: jsonData['organized_trip_id'],
      organizerId: jsonData['organizer_id'],
      organizer: jsonData['from_organizer'],
      date: jsonData['created_at'],
      id: jsonData['id'],
      organizerName: jsonData['organizer_name'],
    );
  }
}
