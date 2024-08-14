import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/announcements/data/models/announcement_subscription_model.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_cubit.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_states.dart';
import 'package:travelapp_flutter/features/announcements/presentation/views/widgets/announcement_subscription_card2.dart';

class SubscriptionsList extends StatelessWidget {
  const SubscriptionsList({
    super.key,
    required this.subscriptions,
    required this.place,
  });
  final String place;
  final List<AnnouncementSubscriptionModel> subscriptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "On $place:",
          style: Styles.heading2.copyWith(fontSize: 24),
        ),
        BlocBuilder<AnnouncementSubscriptionCubit,
            AnnouncementSubscriptionStates>(
          builder: (context, state) {
            final selectedSub =
                BlocProvider.of<AnnouncementSubscriptionCubit>(context)
                    .selectedSub;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  ...List.generate(subscriptions.length, (index) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width - 60,
                      child: AnnouncementSubscriptionCard2(
                        subscription: subscriptions[index],
                        selected: selectedSub == subscriptions[index],
                      ),
                    );
                  })
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
