import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/all_chats/all_chats_page_body.dart';

class AllChatsPage extends StatelessWidget {
  const AllChatsPage({super.key, required this.controller});
final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: AllChatsPageBody(controller: controller),
    );
  }
}
