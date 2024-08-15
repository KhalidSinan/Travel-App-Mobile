import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:socket_io_client/socket_io_client.dart' as Io;
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo_impl.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit_states.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/chat_card.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/chat_filter_sheet.dart';

class AllChatsTab extends StatefulWidget {
  const AllChatsTab({
    super.key, required this.controller,
  });
final ScrollController controller;
  @override
  State<AllChatsTab> createState() => _AllChatsTabState();
}

class _AllChatsTabState extends State<AllChatsTab> {
  late Io.Socket socket;
  Map<String, String> lastMessages = {};
  String? errorMessage;
  @override
  void initState() {
    super.initState();
    initializeSocket();
  }

  void initializeSocket() {
    socket = Io.io(
      "${getIt.get<ApiService>().baseUrl}/?token=${getIt.get<AuthRepoImpl>().token}",
      {
        "transports": ['websocket'],
        "autoConnect": false,
      },
    );
    if (!socket.connected) {
      socket.connect();
    }

    socket.onConnect((_) {
      print('Connected with the server');
      setState(() {});
    });

    socket.on('new-message', (data) {
      lastMessages[data['chat_id']] = data['message'];
      setState(() {});
    });

    socket.onDisconnect((_) {
      print('Disconnected from the server!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        ChatImplRepo(getIt.get<ApiService>()),
      )..getAllChats(),
      child: BlocConsumer<ChatCubit, ChatCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetAllChatsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllChatsFailureState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    state.failure.errMessage,
                    style: Styles.content,
                  )
                ],
              ),
            );
          } else if (state is EmptyChatsState) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      final chat = BlocProvider.of<ChatCubit>(context);
                      Get.bottomSheet(
                        BlocProvider.value(
                          value: chat,
                          child: const ChatFilterSheet(),
                        ),
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.filter,
                      color: Themes.third,
                    ),
                  ),
                ),
                const Text(
                  'No Chats Yet',
                  style: Styles.subtitle,
                )
              ],
            );
          } else {
            if (!socket.connected) {
              return reconnectSocket();
            }
            final chats = BlocProvider.of<ChatCubit>(context).chats;
            final count = BlocProvider.of<ChatCubit>(context).count1;
            return ListView(
              controller: controller,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      final chat = BlocProvider.of<ChatCubit>(context);
                      Get.bottomSheet(
                        BlocProvider.value(
                          value: chat,
                          child: const ChatFilterSheet(),
                        ),
                      );
                    },
                    icon: Icon(
                      FontAwesomeIcons.filter,
                      color: Themes.third,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ...List.generate(chats!.length, (index) {
                  return ChatCard(
                    chat: chats[index],
                    socket: socket,
                    lastMessage: lastMessages[chats[index].id],
                  );
                }),
                Offstage(
                  offstage: ((count! / flightsInSinglePage).ceil()) <= 1,
                  child: NumberPaginator(
                    numberPages: max((count / flightsInSinglePage).ceil(), 1),
                    initialPage: 0,
                    onPageChange: (index) async {
                      await BlocProvider.of<ChatCubit>(context)
                          .changeAllChatsPage(index + 1);
                    },
                    config: NumberPaginatorUIConfig(
                      buttonSelectedBackgroundColor: Themes.primary,
                      buttonUnselectedForegroundColor: Themes.third,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Column reconnectSocket() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Connection Error',
          style: Styles.content,
        ),
        IconButton(
            onPressed: () {
              socket.connect();
            },
            icon: const Icon(
              FontAwesomeIcons.refresh,
              color: Colors.black38,
            )),
      ],
    );
  }
}
