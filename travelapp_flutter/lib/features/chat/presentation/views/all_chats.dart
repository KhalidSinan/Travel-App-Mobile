import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/all_chats_page_body.dart';

class AllChatsPage extends StatelessWidget {
  const AllChatsPage({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: Styles.heading,
        ),
      ),
      body: SafeArea(
        child: AllChatsPageBody(controller: controller),
      ),
    );
  }
}
