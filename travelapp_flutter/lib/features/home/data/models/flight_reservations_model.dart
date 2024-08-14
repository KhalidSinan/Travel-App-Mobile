class FlightReservationsModel {
  final String id;
  final String source;
  final String destination;
  final String twoWay;
  final double price;
  final int seats;
  final bool completed;
  final String? date;
  final String? sAirpost;
  final String? dAirport;

  FlightReservationsModel({
    required this.id,
    required this.source,
    required this.destination,
    required this.twoWay,
    required this.price,
    required this.seats,
    required this.date,
    required this.sAirpost,
    required this.dAirport,
    required this.completed,
  });

  factory FlightReservationsModel.fromJson(jsonData) {
    return FlightReservationsModel(
      id: jsonData['id'],
      source: jsonData['source'],
      destination: jsonData['destination'],
      twoWay: jsonData['reservation_type'],
      price: jsonData['overall_price'],
      seats: jsonData['num_of_reservations'],
      date: jsonData['date'],
      sAirpost: jsonData['source_airport'],
      dAirport: jsonData['destination_airport'],
      completed: jsonData['completed'],
    );
  }
}
