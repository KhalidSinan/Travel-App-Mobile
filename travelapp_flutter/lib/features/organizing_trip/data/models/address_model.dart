class AddressModel {
  final String city;
  final String country;
  final String? address;
  final String? id;

  AddressModel({
    required this.city,
    required this.country,
    required this.address,
    required this.id,
  });

  factory AddressModel.fromJson(jsonData) {
    return AddressModel(
      city: jsonData['city'],
      country: jsonData['country'],
      address: jsonData['address'],
      id: jsonData['_id'],
    );
  }
}
