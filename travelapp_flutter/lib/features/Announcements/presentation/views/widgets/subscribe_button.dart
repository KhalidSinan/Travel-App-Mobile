import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_cubit.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_states.dart';
import 'package:travelapp_flutter/features/announcements/presentation/views/announcement_success_page.dart';
import 'package:travelapp_flutter/features/announcements/presentation/views/widgets/home_subscribe_sheet.dart';

class SubscribeButton extends StatelessWidget {
  const SubscribeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnnouncementSubscriptionCubit,
        AnnouncementSubscriptionStates>(
      listener: announcementsListener,
      builder: (context, state) {
        final selectedSub =
            BlocProvider.of<AnnouncementSubscriptionCubit>(context).selectedSub;
        return Offstage(
          offstage: selectedSub == null,
          child: SizedBox(
            width: double.infinity,
            child: (state is LoadingSubscribeState)
                ? const Center(child: CircularProgressIndicator())
                : CustomButton(
                    onPressed: () async {
                      await BlocProvider.of<AnnouncementSubscriptionCubit>(
                              context)
                          .subscribe();
                    },
                    label: selectedSub == null
                        ? ''
                        : selectedSub.place == 'Home'
                            ? 'Details'
                            : 'Subscribe',
                  ),
          ),
        );
      },
    );
  }

  void announcementsListener(context, state) {
    if (state is SelectedSubscribeHomeState) {
      final announcement =
          BlocProvider.of<AnnouncementSubscriptionCubit>(context);
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return BlocProvider.value(
            value: announcement,
            child: const HomeSubscribeSheet(),
          );
        },
      );
    } else if (state is FailureSubscribeState) {
      showCustomSnackBar(
        title: 'Make Announcement Failed',
        message: state.failure.errMessage.toString(),
      );
    } else if (state is SuccessSubscribeState) {
      Get.off(() => const AnnouncementSubscribeSuccessPage());
    }
  }
}
