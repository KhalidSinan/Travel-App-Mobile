import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo_impl.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit_states.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit(this.chatImplRepo) : super(ChatCubitInitialState());

  final ChatImplRepo chatImplRepo;

  Future<void> createGroupChat({
    required String tripId,
    required String groupName,
  }) async {
    emit(CreatedChatLoadingState());
    var response = await chatImplRepo.createChatForTrip(
      tripId: tripId,
      groupName: groupName,
    );
    response.fold(
      (failure) {
        emit(CreatedChatFailureState(failure: failure));
      },
      (res) {
        emit(CreatedChatSuccessState());
      },
    );
  }
}
