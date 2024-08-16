import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/Announcements/presentation/views/widgets/announcements_subscriptions_page_body.dart';
import 'package:travelapp_flutter/features/announcements/data/repos/announcements_repo_impl.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_cubit.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_states.dart';

class AnnouncementsSubscriptionsPage extends StatelessWidget {
  const AnnouncementsSubscriptionsPage({super.key, required this.tripId});
  final String tripId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => AnnouncementSubscriptionCubit(
        AnnouncementsRepoImpl(
          getIt.get<ApiService>(),
        ),
        tripId: tripId,
      )..getAnnouncementSubscriptions(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: BlocBuilder<AnnouncementSubscriptionCubit,
            AnnouncementSubscriptionStates>(
          builder: (context, state) {
            if (state is LoadingGetSubscriptionsState) {
              return const Center(child: CustomLoading());
            } else if (state is FailureGetSubscriptionsState) {
              return Center(
                child: Text(
                  state.failure.errMessage.toString(),
                  style: Styles.content,
                ),
              );
            } else {
              return const AnnouncementsSubscriptionsPageBody();
            }
          },
        ),
      ),
    );
  }
}
