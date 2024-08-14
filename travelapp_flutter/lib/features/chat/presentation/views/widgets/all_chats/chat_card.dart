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

class ChatCard extends StatefulWidget {
  const ChatCard({
    super.key,
    this.joined = true,
    required this.chat,
  });

  final bool joined;
  final ChatModel chat;

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  late Io.Socket socket;
  String? errorMessage;
  @override
  void initState() {
    super.initState();
    initializeSocket();
  }

  void initializeSocket() {
    socket = Io.io(
      "https://faac-5-0-51-232.ngrok-free.app/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjdlNmNhZDRhNzA2NmU5OGYxZmY1M2NiYiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFkZGlzb24iLCJsYXN0X25hbWUiOiJFcmRtYW4ifSwiaWF0IjoxNzIzNjQyNzczfQ.F88wr-incOLvWn5ZrusX2F-9uc9TCLvCbz98E6hKsbk",
      {
        "transports": ['websocket'],
        "autoConnect": false,
      },
    );

    socket.onConnect((_) {
      print('Connected with the server');
    });

    socket.on('chat-error', (data) {
      print("Error occurred: $data");
      showCustomSnackBar(title: 'Error', message: data['message']);
    });

    socket.onDisconnect((_) {
      print('Disconnected from the server!');
    });
  }

  void _handleButtonPressed() async {
    if (!socket.connected) {
      socket.connect();
      await Future.delayed(const Duration(milliseconds: 500));
    }
    socket.emit('join-chat', widget.chat.id);
    await Future.delayed(const Duration(milliseconds: 100));

    if (errorMessage != null) {
      showCustomSnackBar(title: 'Error', message: errorMessage!);
    } else {
      Get.to(() => GroupChat(socket: socket));
    }
  }

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
                widget.chat.startDate,
                style: Styles.subtitle,
              ),
              Text(
                widget.chat.endDate,
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
                  widget.chat.name,
                  style: Styles.heading2,
                ),
              ),
              Text(
                '(${widget.chat.numberOfPeople})',
                style: Styles.content,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.chat.lastMessage,
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
                  offstage: widget.joined,
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
                              chat: widget.chat,
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
                  offstage: !widget.joined,
                  child: JoinChatButton(
                    label: 'Enter Chat',
                    onPressed: _handleButtonPressed,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
