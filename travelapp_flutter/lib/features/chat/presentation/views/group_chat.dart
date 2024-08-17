import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/chat/data/models/chat_model.dart';

class GroupChat extends StatefulWidget {
  const GroupChat({
    super.key,
    required this.socket,
    required this.chat,
  });

  final Io.Socket socket;
  final ChatModel chat;
  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  List<Map<String, dynamic>> messages = [];
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _initializeSocketListeners();
  }

  void _initializeSocketListeners() {
    widget.socket.onConnect((_) {
      print("Connected to server for chat");
      _requestChatHistory();
    });

    widget.socket.on('chat-history', (data) {
      print("Chat history received: $data");
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
            'image': message['image'],
          };
        }).toList();
      });
      _scrollToBottom();
    });

    widget.socket.on('receive-message', (data) {
      print("Message received: $data");
      setState(() {
        messages.add({
          'text': data['content'],
          'sender': data['username'],
          'senderName': data['username'],
          'userPhoto': data['user_profile_pic'],
          'userColor': Color(int.parse(data['user_color'])),
          'from_me': data['from_me'],
          'isExpanded': false,
          'image': data['image'],
        });
      });
      _scrollToBottom();
    });

    widget.socket.onDisconnect((_) {
      print('Disconnected from the server!');
    });
  }

  void _requestChatHistory() {
    widget.socket.emit('chat-history', "66bb029ddd35aaff48468f70");
  }

  @override
  void dispose() {
    widget.socket.off('chat-history');
    widget.socket.off('receive-message');
    super.dispose();
  }

  void _sendMessage({String? textMessage, XFile? imageFile}) async {
    String? imageBase64;
    if (imageFile != null) {
      Uint8List imageBytes = await imageFile.readAsBytes();
      imageBase64 = base64Encode(imageBytes);
    }

    final messageData = {
      'message': textMessage ?? '',
      'image': imageBase64,
    };

    widget.socket.emit('send-message', messageData);
    _textEditingController.clear();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _showImageSourceSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    _sendMessage(
                        textMessage: "Image sent", imageFile: pickedFile);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile =
                      await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    _sendMessage(
                        textMessage: "Image sent", imageFile: pickedFile);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleMessageExpansion(int index) {
    setState(() {
      messages[index]['isExpanded'] = !messages[index]['isExpanded'];
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double messageBarHeight = 60.0;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              widget.socket.emit("leave-chat");
              Navigator.of(context).pop();
            },
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 20,
              color: Themes.primary,
            ),
          ),
          title: Text(
            widget.chat.name,
            style: Styles.heading2.copyWith(fontSize: 16),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  widget.chat.numberOfPeople,
                  style: TextStyle(color: Themes.primary),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
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
                                crossAxisAlignment: message['from_me']
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
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
                                  if (message['image'] != null)
                                    Card(
                                      margin: const EdgeInsets.only(top: 5.0),
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: message['image'],
                                        height: 200,
                                        width: 200,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const CustomLoading(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
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
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.image, color: Themes.primary),
                    onPressed: _showImageSourceSelection,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                controller: _textEditingController,
                                decoration: const InputDecoration(
                                  hintText: "Type a message...",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send, color: Themes.primary),
                            onPressed: () {
                              _sendMessage(
                                  textMessage:
                                      _textEditingController.text.trim());
                            },
                          ),
                        ],
                      ),
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
