<<<<<<< HEAD
abstract class ChatCubitState {}

class ChatCubitInitialState extends ChatCubitState {}
=======
import 'package:travelapp_flutter/core/helpers/failure.dart';

abstract class ChatCubitState {}

class ChatCubitInitialState extends ChatCubitState {}

class CreatedChatSuccessState extends ChatCubitState {}

class CreatedChatLoadingState extends ChatCubitState {}

class CreatedChatFailureState extends ChatCubitState {
  final Failure failure;

  CreatedChatFailureState({required this.failure});
}
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
