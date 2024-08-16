import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo_impl.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit_states.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/chat_card.dart';

class NotJoinedChatsTab extends StatelessWidget {
  const NotJoinedChatsTab({
    super.key, required this.controller,
  });
final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        ChatImplRepo(getIt.get<ApiService>()),
      )..getAllJoinableChats(),
      child: BlocConsumer<ChatCubit, ChatCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetAllChatsLoadingState) {
            return const Center(child: CustomLoading());
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
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Chats To Join',
                  style: Styles.subtitle,
                )
              ],
            );
          } else {
            final joinable = BlocProvider.of<ChatCubit>(context).joinable;
            final count = BlocProvider.of<ChatCubit>(context).count2;
            return ListView(
              controller: controller,
              children: [
                const SizedBox(height: 24),
                ...List.generate(joinable!.length, (index) {
                  return ChatCard(
                    chat: joinable[index],
                    joined: false,
                  );
                }),
                Offstage(
                  offstage: ((count! / flightsInSinglePage).ceil()) <= 1,
                  child: NumberPaginator(
                    numberPages: max((count / flightsInSinglePage).ceil(), 1),
                    initialPage: 0,
                    onPageChange: (index) async {
                      await BlocProvider.of<ChatCubit>(context)
                          .changeJoinableChatsPage(index + 1);
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
}
