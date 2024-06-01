class SuccesRoomReservationModel {
  final String code;
  final int count;
  final String id;

  SuccesRoomReservationModel(
      {required this.code, required this.count, required this.id});

  factory SuccesRoomReservationModel.from(json) {
    return SuccesRoomReservationModel(
        code: json['code'], count: json['count'], id: json['_id']);
  }
}