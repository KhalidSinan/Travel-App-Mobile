import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_cubit.dart';
import 'package:travelapp_flutter/features/announcements/presentation/views/widgets/subscribe_button.dart';
import 'package:travelapp_flutter/features/announcements/presentation/views/widgets/subscriptions_list.dart';

class AnnouncementsSubscriptionsPageBody extends StatelessWidget {
  const AnnouncementsSubscriptionsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final homeSubscriptions =
        BlocProvider.of<AnnouncementSubscriptionCubit>(context)
            .getHomeSubscriptions();
    final organizedSubscriptions =
        BlocProvider.of<AnnouncementSubscriptionCubit>(context)
            .getOrganizedSubscriptions();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Make an Announcement",
            style: Styles.heading2,
          ),
          Text(
            "Choose the announcement package that suits you, your trip will appear according to the place and duration you choose.",
            style: Styles.content.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Text(
            "We will check for your request as soon as possible",
            style: Styles.subtitle,
          ),
          const SizedBox(height: 24),
          SubscriptionsList(
            place: 'Home Page',
            subscriptions: homeSubscriptions,
          ),
          const SizedBox(height: 8),
          SubscriptionsList(
            place: 'Organized Trips Page',
            subscriptions: organizedSubscriptions,
          ),
          const Spacer(),
          const SubscribeButton(),
        ],
      ),
    );
  }
}







// Container(
    //   padding: const EdgeInsets.all(24),
    //   child: Column(
    //     children: [
    //       Text(
    //         "Announcement Subscriptions",
    //         style: Styles.heading,
    //       ),
    //       const Spacer(),
    //       SizedBox(
    //         height: MediaQuery.sizeOf(context).height * .6,
    //         child: ListView(
    //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
    //           scrollDirection: Axis.horizontal,
    //           children: [
    //             AnnouncementSubscriptionCard(
    //               subscribeName: 'Standard',
    //               price: 150,
    //               features: const [
    //                 'feature',
    //                 'feature',
    //                 'feature',
    //               ],
    //               color: Themes.primary,
    //             ),
    //             const SizedBox(width: 16),
    //             AnnouncementSubscriptionCard(
    //               subscribeName: 'Standard',
    //               price: 250,
    //               features: const [
    //                 'feature',
    //                 'feature',
    //                 'feature',
    //               ],
    //               color: Themes.third,
    //             ),
    //             const SizedBox(width: 16),
    //             const AnnouncementSubscriptionCard(
    //               subscribeName: 'Basic',
    //               price: 100,
    //               features: [
    //                 'feature',
    //                 'feature',
    //               ],
    //               color: Colors.grey,
    //             ),
    //             const SizedBox(width: 16),
    //             const AnnouncementSubscriptionCard(
    //               subscribeName: 'Basic',
    //               price: 200,
    //               features: ['feature'],
    //               color: Colors.grey,
    //             ),
    //           ],
    //         ),
    //       ),
    //       const Spacer(flex: 2),
    //     ],
    //   ),
    // );