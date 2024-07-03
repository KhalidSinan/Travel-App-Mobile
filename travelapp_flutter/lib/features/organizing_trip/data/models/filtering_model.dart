class FilterModel {
   String? timeStart;
   String? timeEnd;
   double? minPrice;
   double? maxPrice;
   String? airline;

  FilterModel(
      {this.timeStart,
      this.timeEnd,
      this.minPrice,
      this.maxPrice,
      this.airline});

  FilterModel copyWith({
    String? timeStart,
    String? timeEnd,
    double? minPrice,
    double? maxPrice,
    String? airline,
  }) {
    return FilterModel(
      timeStart: timeStart ?? this.timeStart,
      timeEnd: timeEnd ?? this.timeEnd,
      maxPrice: maxPrice ?? this.maxPrice,
      minPrice: minPrice ?? this.minPrice,
      airline: airline ?? this.airline,
    );
  }

  // factory FilterModel.fromJson(jsonData) {
  //   return FilterModel(
  //       timeStart: jsonData['time_start'],
  //       timeEnd: jsonData['time_end'],
  //       minPrice: jsonData['min_price'],
  //       maxPrice: jsonData['max_price'],
  //       airline: jsonData['airline']);
  // }
}
