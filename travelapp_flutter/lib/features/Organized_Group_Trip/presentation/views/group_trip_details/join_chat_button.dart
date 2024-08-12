import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_oval_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_states.dart';

class JoinChatButton extends StatelessWidget {
  const JoinChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final joinedChat =
        BlocProvider.of<GroupTripDetailsCubit>(context).joinedChat;
    return BlocConsumer<GroupTripDetailsCubit, GroupTripDetailsState>(
      listener: (context, state) {
        if (state is FailureJoinGroupChatState) {
          showCustomSnackBar(
            title: 'Join Chat Failed',
            message: state.failure.errMessage,
          );
        } else if (state is SuccessJoinGroupChatState) {}
        showCustomSnackBar(
          title: 'Join Chat Success',
          message: 'You\'ve joined the chat successfully',
        );
      },
      builder: (context, state) {
        if (state is LoadingJoinGroupChatState) {
          return const CircularProgressIndicator();
        } else {
          return Offstage(
            offstage: joinedChat,
            child: CustomOvalButton(
              label: 'Join chat',
              color: Themes.third,
              onPressed: () {
                final groupTrip =
                    BlocProvider.of<GroupTripDetailsCubit>(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return BlocProvider.value(
                      value: groupTrip,
                      child: AlertDialog(
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
                          CustomTextButton(
                            onPressed: () async {
                              await groupTrip.joinChat();
                              Get.back();
                            },
                            label: 'Yes',
                            color: Themes.primary,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
