class PassengersModel {
  final String personName;
  final String seatClass;
  final String seatNumber;
  final String price;
  final String id;

  PassengersModel(
      {required this.personName,
      required this.seatClass,
      required this.seatNumber,
      required this.price,
      required this.id});

  factory PassengersModel.fromJson(jsonData) {
    return PassengersModel(
        personName: jsonData['person_name'],
        seatClass: jsonData['seat_class'],
        seatNumber: jsonData['seat_number'],
        price: jsonData['price'],
        id: jsonData['_id']);
  }
}
