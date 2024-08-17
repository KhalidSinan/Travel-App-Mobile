import 'package:socket_io_client/socket_io_client.dart' as Io;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/join_chat_button.dart';
import 'package:travelapp_flutter/features/chat/data/models/chat_model.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/group_chat.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/join_chat_dialog.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    this.joined = true,
    required this.chat,
    this.socket,
    this.lastMessage,
  });

  final bool joined;
  final String? lastMessage;
  final ChatModel chat;
  final Io.Socket? socket;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Themes.secondary,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: Colors.black38,
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chat.startDate,
                style: Styles.subtitle,
              ),
              Text(
                chat.endDate,
                style: Styles.subtitle,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  chat.name,
                  style: Styles.heading2,
                ),
              ),
              Text(
                '(${chat.numberOfPeople})',
                style: Styles.content,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  lastMessage ?? chat.lastMessage,
                  style: Styles.content.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Offstage(
                  offstage: joined,
                  child: JoinChatButton(
                    label: 'Join Chat',
                    onPressed: () {
                      final chatCubit = BlocProvider.of<ChatCubit>(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return BlocProvider.value(
                            value: chatCubit,
                            child: JoinChatDialog(
                              chatCubit: chatCubit,
                              chat: chat,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Offstage(
                  offstage: !joined,
                  child: JoinChatButton(
                    label: 'Enter Chat',
                    onPressed: joinChat,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void joinChat() async {
    String? errorMessage;
    socket!.on('chat-error', (data) {
      print("Error occurred: $data");
      errorMessage = data;
      showCustomSnackBar(title: 'Error', message: data['message']);
    });
    socket!.emit('join-chat', chat.id);
    await Future.delayed(const Duration(milliseconds: 100));

    if (errorMessage != null) {
      showCustomSnackBar(title: 'Chat Error', message: errorMessage!);
    } else {
      Get.to(() => GroupChat(socket: socket!));
    }
  }
}
