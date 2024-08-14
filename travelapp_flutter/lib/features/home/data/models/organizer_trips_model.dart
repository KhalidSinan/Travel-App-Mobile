class OrganizerTripsModel {
  final String id;
  final String source;
  final String destenations;
  final String date;
  final double price;
  final String people;
  final int days;
  final List<String> type;
  final bool completed;

  OrganizerTripsModel({
    required this.id,
    required this.source,
    required this.destenations,
    required this.date,
    required this.price,
    required this.people,
    required this.days,
    required this.type, 
    required this.completed,
  });

  factory OrganizerTripsModel.fromJson(jsonData) {
    return OrganizerTripsModel(
      id: jsonData['id'],
      source: jsonData['starting_place'],
      destenations: jsonData['destinations'],
      date: jsonData['starting_date'],
      price: jsonData['price'],
      days:jsonData['num_of_days'],
      people: jsonData['num_of_people_participating'],
      type: List<String>.from(jsonData['type_of_trip']),
      completed: jsonData['is_complete'], 
    );
  }
}
