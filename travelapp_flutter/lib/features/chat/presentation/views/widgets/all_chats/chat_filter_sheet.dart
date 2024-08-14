import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit_states.dart';

class ChatFilterSheet extends StatelessWidget {
  const ChatFilterSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: MediaQuery.sizeOf(context).height * .45,
      child: BlocBuilder<ChatCubit, ChatCubitState>(
        builder: (context, state) {
          final currentType = BlocProvider.of<ChatCubit>(context).chatType;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chat Filter',
                style: Styles.heading2,
              ),
              RadioListTile(
                value: 'All',
                groupValue: currentType,
                activeColor: Themes.third,
                title: Text(
                  'All Chats',
                  style: Styles.content.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onChanged: (type) {
                  BlocProvider.of<ChatCubit>(context).changeChatType(type!);
                },
              ),
              RadioListTile(
                value: 'Present',
                groupValue: currentType,
                activeColor: Themes.third,
                title: Text(
                  'On Going Chats Only',
                  style: Styles.content.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onChanged: (type) {
                  BlocProvider.of<ChatCubit>(context).changeChatType(type!);
                },
              ),
              RadioListTile(
                value: 'Past',
                groupValue: currentType,
                activeColor: Themes.third,
                title: Text(
                  'Finished Chats Only',
                  style: Styles.content.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                onChanged: (type) {
                  BlocProvider.of<ChatCubit>(context).changeChatType(type!);
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () async {
                    await BlocProvider.of<ChatCubit>(context).getAllChats();
                    Get.back();
                  },
                  label: 'Apply Filters',
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
