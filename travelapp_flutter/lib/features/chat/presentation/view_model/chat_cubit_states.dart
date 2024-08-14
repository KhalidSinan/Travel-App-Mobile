import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ChatCubitState {}

class ChatCubitInitialState extends ChatCubitState {}

class CreatedChatSuccessState extends ChatCubitState {}

class CreatedChatLoadingState extends ChatCubitState {}

class CreatedChatFailureState extends ChatCubitState {
  final Failure failure;

  CreatedChatFailureState({required this.failure});
}

class GetAllChatsSuccessState extends ChatCubitState {}

class GetAllChatsLoadingState extends ChatCubitState {}

class GetAllChatsFailureState extends ChatCubitState {
  final Failure failure;

  GetAllChatsFailureState({required this.failure});
}

class EmptyChatsState extends ChatCubitState {}

class ChangeChatType extends ChatCubitState {}

class JoinChatLoadingState extends ChatCubitState {}

class JoinChatFailureState extends ChatCubitState {
  final Failure failure;

  JoinChatFailureState({required this.failure});
}

class JoinChatSuccessState extends ChatCubitState {}
