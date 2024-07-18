class NumberModel {
  final String code;
  final String number;

  NumberModel({
    required this.code,
    required this.number,
  });

  factory NumberModel.fromJson(jsonData) {
    return NumberModel(
      code: jsonData['country_code'],
      number: jsonData['number'],
    );
  }
}
