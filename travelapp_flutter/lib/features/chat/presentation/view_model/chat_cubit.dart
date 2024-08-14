import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/chat/data/models/chat_model.dart';
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo_impl.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit_states.dart';

class ChatCubit extends Cubit<ChatCubitState> {
  ChatCubit(this.chatImplRepo) : super(ChatCubitInitialState());

  final ChatImplRepo chatImplRepo;

  int page1 = 1, page2 = 1;
  int? count1, count2;
  List<ChatModel>? chats;
  List<ChatModel>? joinable;
  String chatType = 'All';

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

  Future<void> joinChat({required String chatId}) async {
    emit(JoinChatLoadingState());
    var response = await chatImplRepo.joinChat(chatId: chatId);
    response.fold(
      (failure) {
        emit(JoinChatFailureState(failure: failure));
      },
      (res) {
        emit(JoinChatSuccessState());
      },
    );
  }

  Future<void> getAllChats() async {
    emit(GetAllChatsLoadingState());

    var response = await chatImplRepo.getAllChats(
      page: page1,
      type: chatType,
    );
    response.fold(
      (failure) {
        emit(GetAllChatsFailureState(failure: failure));
      },
      (res) {
        if (res['count'] == 0) {
          emit(EmptyChatsState());
          return;
        }
        List<ChatModel> chats = [];
        for (var chat in res['data']) {
          chats.add(ChatModel.fromJson(chat));
        }
        count1 = res['count'];
        this.chats = chats;
        emit(GetAllChatsSuccessState());
      },
    );
  }

  Future<void> getAllJoinableChats() async {
    emit(GetAllChatsLoadingState());
    var response = await chatImplRepo.getAllJoinableChats(page: page2);
    response.fold(
      (failure) {
        emit(GetAllChatsFailureState(failure: failure));
      },
      (res) {
        if (res['count'] == 0) {
          emit(EmptyChatsState());
          return;
        }
        List<ChatModel> joinable = [];
        for (var chat in res['data']) {
          joinable.add(ChatModel.fromJson(chat));
        }
        count2 = res['count'];
        this.joinable = joinable;
        emit(GetAllChatsSuccessState());
      },
    );
  }

  Future<void> changeAllChatsPage(int page) async {
    page1 = page;
    await getAllChats();
  }

  Future<void> changeJoinableChatsPage(int page) async {
    page2 = page;
    await getAllJoinableChats();
  }

  void changeChatType(String type) {
    chatType = type;
    emit(ChangeChatType());
  }
}
