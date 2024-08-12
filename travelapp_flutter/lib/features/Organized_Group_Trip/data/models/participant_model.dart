class ParticipantModel {
  final String name;
  final String passport;

  ParticipantModel({required this.name, required this.passport});
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "passport_number": passport,
    };
  }
}
