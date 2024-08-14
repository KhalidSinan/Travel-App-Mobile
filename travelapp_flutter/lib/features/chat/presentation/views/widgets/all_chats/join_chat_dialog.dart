import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/chat/data/models/chat_model.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit_states.dart';

class JoinChatDialog extends StatelessWidget {
  const JoinChatDialog({
    super.key,
    required this.chatCubit,
    required this.chat,
  });

  final ChatCubit chatCubit;
  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatCubitState>(
      listener: (context, state) {
        if (state is JoinChatFailureState) {
          Get.back();
          showCustomSnackBar(
            title: 'Join Chat Failed',
            message: state.failure.errMessage.toString(),
          );
        } else if (state is JoinChatSuccessState) {
          showCustomSnackBar(
            title: 'Enjoy',
            message: 'You\'ve joined the chat successfully',
          );
        }
      },
      builder: (context, state) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Join Chat",
        ),
        content: const Text(
            "Are you sure you want to join group chat for this trip?"),
        actions: [
          CustomTextButton(
            onPressed: () => Get.back(),
            label: 'Back',
          ),
          (state is JoinChatLoadingState)
              ? const CircularProgressIndicator()
              : CustomTextButton(
                  onPressed: () async {
                    await chatCubit.joinChat(chatId: chat.id);
                    Get.back();
                  },
                  label: 'Yes',
                  color: Themes.primary,
                ),
        ],
      ),
    );
  }
}
