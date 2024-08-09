import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/chat/data/repos/chat_repo_impl.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/widgets/create_chat/create_chat_page_body.dart';

class CreateChatPage extends StatelessWidget {
  const CreateChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt.get<ChatImplRepo>()),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: const CreateChatPageBody(),
      ),
    );
  }
}
