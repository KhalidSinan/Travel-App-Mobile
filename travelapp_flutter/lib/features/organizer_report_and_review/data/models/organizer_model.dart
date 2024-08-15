class OrganizerModel {
  final String id;
  final String name;
  final String picture;

  OrganizerModel({
    required this.id,
    required this.name,
    required this.picture,
  });

  factory OrganizerModel.fromJson(jsonData) {
    return OrganizerModel(
      id: jsonData['id'],
      name: jsonData['name'],
      picture: jsonData['personal_picture'],
    );
  }
}
