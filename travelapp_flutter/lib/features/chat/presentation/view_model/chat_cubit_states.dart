import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ChatCubitState {}

class ChatCubitInitialState extends ChatCubitState {}

class CreatedChatSuccessState extends ChatCubitState {}

class CreatedChatLoadingState extends ChatCubitState {}

class CreatedChatFailureState extends ChatCubitState {
  final Failure failure;

  CreatedChatFailureState({required this.failure});
}
