class GroupTripsModel {
   final String id;
  final String source;
  final String destenations;
  final String date;
  final String organizerName;
  final List<String> type;
  final double price;
  final int days;
  final bool completed;

  GroupTripsModel({
    required this.id, 
    required this.source,
    required this.destenations,
    required this.date,
    required this.organizerName,
    required this.type,
    required this.price,
    required this.days,
    required this.completed,
  });

  factory GroupTripsModel.fromJson(jsonData) {
    return GroupTripsModel(
       id: jsonData['id'],
      source: jsonData['starting_place'],
      destenations: jsonData['destinations'],
      date: jsonData['start_date'],
      organizerName: jsonData['organizer_name'],
      type: List<String>.from(jsonData['type_of_trip']),
      price: jsonData['overall_price'],
      days: jsonData['num_of_days'],
      completed: jsonData['completed'],
    );
  }
}
