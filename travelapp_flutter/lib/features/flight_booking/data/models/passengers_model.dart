class PassengerModel {
  final String personName;
  final String seatClass;
  final String seatNumber;
  final double price;
  final String personPassport;
  final String id;

  PassengerModel({
    required this.personName,
    required this.seatClass,
    required this.seatNumber,
    required this.price,
    required this.personPassport,
    required this.id,
  });

  factory PassengerModel.fromJson(jsonData) {
    return PassengerModel(
        id: jsonData['_id'],
        personName: jsonData['person_name'],
        seatClass: jsonData['seat_class'],
        seatNumber: jsonData['seat_number'],
        price: jsonData['price'],
        personPassport: jsonData['person_passport']);
  }
}
