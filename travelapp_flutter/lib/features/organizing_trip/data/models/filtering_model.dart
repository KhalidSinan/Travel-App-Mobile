class FilterModel {
  final String timeStart;
  final String timeEnd;
  final double minPrice;
  final double maxPrice;
  final String airline;

  FilterModel(
      {required this.timeStart,
      required this.timeEnd,
      required this.minPrice,
      required this.maxPrice,
      required this.airline});

  // factory FilterModel.fromJson(jsonData) {
  //   return FilterModel(
  //       timeStart: jsonData['time_start'],
  //       timeEnd: jsonData['time_end'],
  //       minPrice: jsonData['min_price'],
  //       maxPrice: jsonData['max_price'],
  //       airline: jsonData['airline']);
  // }
}
