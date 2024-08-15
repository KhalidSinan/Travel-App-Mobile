import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/all_chats_tab.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/chat_card.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/not_joined_chats_tab.dart';

class AllChatsPageBody extends StatelessWidget {
  const AllChatsPageBody({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chats',
              style: Styles.heading,
            ),
            const SizedBox(height: 16),
            TabBar(
              labelColor: Themes.primary,
              dividerHeight: 0,
              indicatorColor: Themes.primary,
              tabs: const [
                Tab(
                  text: 'All Chats',
                ),
                Tab(
                  text: 'Not Joined Chats',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllChatsTab(controller: controller),
                  NotJoinedChatsTab(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
