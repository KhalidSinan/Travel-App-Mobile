import 'package:flutter/material.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;

class GroupChat extends StatefulWidget {
  final Io.Socket socket;

  const GroupChat({super.key, required this.socket});

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  List<Map<String, dynamic>> messages = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Listen for chat history
    widget.socket.onConnect((_) {
      print('Connected to server for chat');
      widget.socket.emit('chat-history');
    });

    widget.socket.on('chat-history', (data) {
      print("Chat history received");
      setState(() {
        messages = (data as List).map((message) {
          return {
            'text': message['content'],
            'sender': message['username'],
            'senderName': message['username'],
            'userPhoto': message['user_profile_pic'],
            'userColor': Color(int.parse(message['user_color'])),
            'from_me': message['from_me'],
            'isExpanded': false,
          };
        }).toList();
      });

      // Scroll to the bottom after loading chat history
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    });

    widget.socket.on('receive-message', (data) {
      print("Message received");
      setState(() {
        messages.add({
          'text': data['content'],
          'sender': data['username'],
          'senderName': data['username'],
          'userPhoto': data['user_profile_pic'],
          'userColor': Color(int.parse(data['user_color'])),
          'from_me': data['from_me'],
          'isExpanded': false,
        });
      });

      // Scroll to the bottom when a new message is received
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    });

    widget.socket.onDisconnect((_) {
      print('Disconnected from the server!');
    });
  }

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    widget.socket.emit('send-message', message);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _toggleMessageExpansion(int index) {
    setState(() {
      messages[index]['isExpanded'] = !messages[index]['isExpanded'];
    });
  }

  @override
  Widget build(BuildContext context) {
    const double messageBarHeight = 60.0;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  Text(
                    "Journey Joy Chat Name",
                    style: Styles.heading2.copyWith(fontSize: 16),
                  ),
                  Text(
                    "12/12",
                    style: TextStyle(color: Themes.primary),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(bottom: messageBarHeight),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isExpanded = message['isExpanded'] as bool;
                  final messageText = message['text'] as String;

                  final displayText = isExpanded || messageText.length <= 100
                      ? messageText
                      : '${messageText.substring(0, 100)}...';

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!message['from_me'])
                          CircleAvatar(
                            backgroundImage: NetworkImage(message['userPhoto']),
                            radius: 20.0,
                          ),
                        if (!message['from_me']) const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _toggleMessageExpansion(index),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.75,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (!message['from_me'])
                                    Text(
                                      message['senderName'],
                                      style: TextStyle(
                                        color: message["userColor"]!,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  BubbleSpecialOne(
                                    seen: true,
                                    text: displayText,
                                    isSender: message['from_me'],
                                    color: message['from_me']
                                        ? Themes.primary
                                        : Colors.grey[300]!,
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      color: message['from_me']
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    tail: true,
                                  ),
                                  if (messageText.length > 100)
                                    InkWell(
                                      onTap: () =>
                                          _toggleMessageExpansion(index),
                                      child: Text(
                                        isExpanded ? 'See less' : 'See all',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MessageBar(
                onSend: _sendMessage,
                sendButtonColor: Themes.primary,
                actions: [
                  InkWell(
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 24,
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: InkWell(
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
