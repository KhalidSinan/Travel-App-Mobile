class SingleTripsModel {
  final String id;
  final String source;
  final String date;
  final String destenations;
  final dynamic price;
  final int people;
  final int days;
  final bool completed;

  SingleTripsModel({
    required this.id,
    required this.source,
    required this.date,
    required this.destenations,
    required this.price,
    required this.people,
    required this.days,
    required this.completed,
  });

  factory SingleTripsModel.fromJson(jsonData) {
    return SingleTripsModel(
      id: jsonData['id'],
      source: jsonData['source'],
      date: jsonData['start_date'],
      destenations: jsonData['destinations'],
      price: jsonData['overall_price'],
      people: jsonData['num_of_people'],
      days: jsonData['num_of_days'],
      completed: jsonData['completed'],
    );
  }
}
