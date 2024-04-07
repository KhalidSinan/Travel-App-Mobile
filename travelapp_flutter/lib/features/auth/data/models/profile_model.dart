class ProfileModel {
  final String email;
  final String fullName;
  final String firstName;
  final String lastName;
  final String? middleName;
  final String? gender;
  final DateTime? dateOfBirth;
  final bool? isGuide;
  final String? avatar;

  ProfileModel({
    required this.email,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.gender,
    required this.dateOfBirth,
    required this.isGuide,
    required this.avatar,
  });

  factory ProfileModel.fromJson(jsonData) {
    String first = jsonData['name']['first_name'];
    String last = jsonData['name']['last_name'];
    String fullName = first + last;
    return ProfileModel(
      email: jsonData['email'],
      fullName: fullName,
      firstName: first,
      lastName: last,
      middleName: null,
      gender: jsonData['gender'],
      dateOfBirth: jsonData['date_of_birth'],
      isGuide: jsonData['is_guide'],
      avatar: jsonData['profile_pic'],
    );
  }
}
