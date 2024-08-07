class RoomTypeModel {
  final List<String>? images;
  final String? code;
  final String? description;
  final dynamic price;
  final String? bedOptions;
  final int? bedOptionsCount;
  final int? sleepsCount;
  final bool? smokingAllowed;
  final int? availableRooms;
  final int? totalRooms;
  final String? type;
  final String? view;
  final List<String>? amenities;
  final String? id;

  RoomTypeModel({
    required this.type,
    required this.images,
    required this.code,
    required this.description,
    required this.price,
    required this.bedOptions,
    required this.bedOptionsCount,
    required this.sleepsCount,
    required this.smokingAllowed,
    required this.availableRooms,
    required this.totalRooms,
    required this.view,
    required this.amenities,
    required this.id,
  });

  factory RoomTypeModel.fromJson(jsonData) {
    return RoomTypeModel(
        images: List<String>.from(jsonData["images"]),
        code: jsonData['code'],
        type: jsonData['type'],
        description: jsonData['description'],
        price: jsonData['price'],
        bedOptions: jsonData['bed_options'],
        bedOptionsCount: jsonData['bed_options_count'],
        sleepsCount: jsonData['sleeps_count'],
        smokingAllowed: jsonData['smoking_allowed'],
        availableRooms: jsonData['available_rooms'],
        totalRooms: jsonData['total_rooms'],
        view: jsonData['view'],
        amenities: List<String>.from(jsonData['amenities']),
        id: jsonData['_id']);
  }
}
