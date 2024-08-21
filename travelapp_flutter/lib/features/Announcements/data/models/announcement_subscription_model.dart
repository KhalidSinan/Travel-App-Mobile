class AnnouncementSubscriptionModel {
  final dynamic price;
  final int duration;
  final String place;

  AnnouncementSubscriptionModel({
    required this.price,
    required this.duration,
    required this.place,
  });

  factory AnnouncementSubscriptionModel.fromJson(jsonData) {
    return AnnouncementSubscriptionModel(
      price: jsonData['price'],
      duration: jsonData['duration'],
      place: jsonData['place'],
    );
  }

  String getSubscriptionDuration() {
    switch (duration) {
      case 1:
        return '1 Day';
      case 3:
        return '3 Days';
      case 7:
        return '7 Days';
      case -1:
        return 'trip start';
      default:
        return 'null';
    }
  }

  String getSubscriptionPlace() {
    switch (place) {
      case 'Home':
        return 'Home Page';
      case 'Organized':
        return 'Organized Trips';
      default:
        return 'null';
    }
  }
}
