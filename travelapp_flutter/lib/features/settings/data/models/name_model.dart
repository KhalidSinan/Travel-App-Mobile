class NameModel {
  final String first;
  final String last;

  NameModel({
    required this.first,
    required this.last,
  });

  factory NameModel.fromJson(jsonData) {
    return NameModel(
      last: jsonData['last_name'],
      first: jsonData['first_name'],
    );
  }
}
