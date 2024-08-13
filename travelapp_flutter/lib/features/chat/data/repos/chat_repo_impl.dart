import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo.dart';

class ChatImplRepo extends ChatRepo {
  final ApiService apiService;
  ChatImplRepo(this.apiService);
}
