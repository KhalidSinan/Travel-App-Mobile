class ProblemOfRoomModel {
  final String code;
  final int available;
  final String message;

  ProblemOfRoomModel(
      {required this.code, required this.available, required this.message});

  factory ProblemOfRoomModel.from(json) {
    return ProblemOfRoomModel(
        code: json['code'],
        available: json['available'],
        message: json['message']);
  }
}