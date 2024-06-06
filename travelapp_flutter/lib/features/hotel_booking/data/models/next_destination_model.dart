class NextDestinationModel {
  //final bool isNext;
  final String city;
  final String date;

  NextDestinationModel({
    //required this.isNext,
    required this.city,
    required this.date,
  });

  factory NextDestinationModel.fromJson(jsonData) {
    return NextDestinationModel(
      //isNext: jsonData[''],
      city: jsonData['city'],
      date: jsonData['date2'],
    );
  }
}
