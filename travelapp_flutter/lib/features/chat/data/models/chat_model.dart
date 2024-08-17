class ChatModel {
  final String id;
  final String name;
  final String startDate;
  final String endDate;
  final String numberOfPeople;
  final String lastMessage;

  ChatModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.numberOfPeople,
    required this.lastMessage,
  });

  factory ChatModel.fromJson(jsonData) {
    return ChatModel(
      id: jsonData['id'],
      name: jsonData['chat_name'],
      startDate: jsonData['start_date'],
      endDate: jsonData['end_date'],
      numberOfPeople: jsonData['num_of_people'],
      lastMessage: jsonData['last_message'] ?? '',
    );
  }
}
