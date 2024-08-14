class RoomModel {
  final dynamic price;
  final String bedOptions;
  final int bedOptionsCount;
  final int sleepsCount;
  final String type;
  final String view;
  final List<String> amenities;
  final String? id;

  RoomModel({
    required this.type,
    required this.price,
    required this.bedOptions,
    required this.bedOptionsCount,
    required this.sleepsCount,
    required this.view,
    required this.amenities,
    required this.id,
  });

  factory RoomModel.fromJson(jsonData) {
    return RoomModel(
      type: jsonData['type'],
      price: jsonData['price'],
      bedOptions: jsonData['bed_options'],
      bedOptionsCount: jsonData['bed_options_count'],
      sleepsCount: jsonData['sleeps_count'],
      view: jsonData['view'],
      amenities: List<String>.from(jsonData['amenities']),
      id: jsonData['id'],
    );
  }
}
