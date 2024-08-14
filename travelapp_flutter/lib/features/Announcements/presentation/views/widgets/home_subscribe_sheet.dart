import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_cubit.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_states.dart';
import 'package:travelapp_flutter/features/announcements/presentation/views/announcement_success_page.dart';

class HomeSubscribeSheet extends StatefulWidget {
  const HomeSubscribeSheet({super.key});

  @override
  State<HomeSubscribeSheet> createState() => _HomeSubscribeSheetState();
}

class _HomeSubscribeSheetState extends State<HomeSubscribeSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, body;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnnouncementSubscriptionCubit,
        AnnouncementSubscriptionStates>(
      listener: (context, state) {
        if (state is FailureSubscribeState) {
          showCustomSnackBar(
            title: 'Make Announcement Failed',
            message: state.failure.errMessage.toString(),
          );
        } else if (state is SuccessSubscribeState) {
          Get.off(() => const AnnouncementSubscribeSuccessPage());
        }
      },
      builder: (context, state) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: CustomSheet(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: ListView(
              children: [
                Text(
                  'Home Announcement Request Details',
                  style: Styles.heading2.copyWith(fontSize: 24),
                ),
                const Text(
                  'We need the title and description for your announcement, to complete the request, those will appear in the home page.',
                  style: Styles.subtitle,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  hintText: 'Announcement title',
                  validator: validateName,
                  onChanged: (newTitle) => title = newTitle,
                  onSaved: (newTitle) => title = newTitle,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: 'Announcement Body',
                  validator: validateName,
                  maxLines: 3,
                  onChanged: (newMessage) => body = newMessage,
                  onSaved: (newMessage) => body = newMessage,
                ),
                const SizedBox(height: 32),
                (state is LoadingSubscribeState)
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onPressed: homeSubscribe,
                          label: 'Subscribe',
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> homeSubscribe() async {
    final announcement =
        BlocProvider.of<AnnouncementSubscriptionCubit>(context);
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await announcement.makeAnnouncement(
        duration: announcement.selectedSub!.duration,
        location: announcement.selectedSub!.place,
        title: title!,
        body: body!,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
