class AllOrganizedTrip {
  final int id;
  final String organizerName;
  final String source;
  final List<String> tripType;
  final double price;
  final String date;
  final String numOfParticipating;
  final bool isAmostComplete;
  final bool isAnnounced;
  final List<String> destinations;

  AllOrganizedTrip(
      {required this.id,
      required this.organizerName,
      required this.source,
      required this.tripType,
      required this.price,
      required this.date,
      required this.destinations,
      required this.numOfParticipating,
      required this.isAmostComplete,
      required this.isAnnounced});

  factory AllOrganizedTrip.fromJson(jsonData) {
    return AllOrganizedTrip(
        id: jsonData["id"],
        organizerName: jsonData["organizer_name"],
        source: jsonData["starting_place"],
        tripType: List<String>.from(jsonData["trip_type"]),
        price: jsonData["price"],
        date: jsonData["starting_date"],
        destinations: List<String>.from(jsonData["destinations"]),
        numOfParticipating: jsonData["num_of_people_participating"],
        isAmostComplete: jsonData["is_almost_complete"],
        isAnnounced: jsonData["is_announced"]);
  }
}
