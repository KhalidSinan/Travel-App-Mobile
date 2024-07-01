class PhoneNumberModel {
  final String number;
  final String countryCode;
  final String id;

  PhoneNumberModel({
    required this.number,
    required this.countryCode,
    required this.id,
  });

  factory PhoneNumberModel.fromJson(jsonData) {
    return PhoneNumberModel(
      number: jsonData['number'],
      countryCode: jsonData['country_code'],
      id: jsonData['_id'],
    );
  }
}
