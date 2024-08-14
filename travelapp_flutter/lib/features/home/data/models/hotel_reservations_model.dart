class HotelReservationsModel {
  final String id;
  final String name;
  final String date;
  final int rooms;
  final int days;
  final num price;
  final bool completed;

  HotelReservationsModel({
    required this.id,
    required this.name,
    required this.date,
    required this.days,
    required this.rooms,
    required this.price,
    required this.completed,
  });

  factory HotelReservationsModel.fromJson(jsonData) {
    return HotelReservationsModel(
      id: jsonData['id'],
      name: jsonData['name'],
      date: jsonData['reservation_date'],
      rooms: jsonData['num_of_rooms'],
      days: jsonData['num_of_days'],
      price: jsonData['overall_price'],
      completed: jsonData['completed'],
    );
  }
}
