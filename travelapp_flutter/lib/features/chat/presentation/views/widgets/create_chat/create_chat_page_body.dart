import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit.dart';
import 'package:travelapp_flutter/features/chat/presentation/view_model/chat_cubit_states.dart';
import 'package:travelapp_flutter/features/chat/presentation/views/all_chats.dart';

class CreateChatPageBody extends StatefulWidget {
  const CreateChatPageBody(
      {super.key, this.tripId = '66b5e99b7a604121637e91dd'});
  final String tripId;
  @override
  State<CreateChatPageBody> createState() => _CreateChatPageBodyState();
}

class _CreateChatPageBodyState extends State<CreateChatPageBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? groupName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatCubitState>(
      listener: chatListener,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Group Chat',
                style: Styles.heading,
              ),
              const Text(
                'Enter the name of the group chat you want to create',
                style: Styles.subtitle,
              ),
              const Spacer(),
              AbsorbPointer(
                absorbing: state is CreatedChatLoadingState,
                child: CustomTextFormField(
                  prefixIcon: Icon(
                    FontAwesomeIcons.message,
                    color: Themes.primary,
                  ),
                  hintText: 'Group Name',
                  validator: validateName,
                  onChanged: (value) => groupName = value,
                  onSaved: (value) => groupName = value,
                ),
              ),
              const Spacer(flex: 3),
              (state is CreatedChatLoadingState)
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onPressed: createChat,
                        label: 'Create',
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createChat() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await BlocProvider.of<ChatCubit>(context).createGroupChat(
        tripId: widget.tripId,
        groupName: groupName!,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void chatListener(context, state) {
    if (state is CreatedChatSuccessState) {
      showCustomSnackBar(
        title: 'Success',
        message: 'Made the $groupName Group',
      );
      Get.off(() => AllChatsPage(
            controller: ScrollController(),
          ));
    }
    if (state is CreatedChatFailureState) {
      showCustomSnackBar(
        title: state.failure.errTitle!,
        message: state.failure.errMessage,
      );
    }
  }
}
