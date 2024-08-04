import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Announcements/presentation/views/widgets/announcement_subscription_card.dart';

class AnnouncementsSubscriptionsPageBody extends StatelessWidget {
  const AnnouncementsSubscriptionsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
      child: Column(
        children: [
          Text(
            "Announcement Subscriptions",
            style: Styles.heading,
          ),
          const Spacer(),
          SizedBox(
            height: 500,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              scrollDirection: Axis.horizontal,
              children: [
                AnnouncementSubscriptionCard(
                  subscribeName: 'Standard',
                  price: 150,
                  features: const [
                    'feature',
                    'feature',
                    'feature',
                  ],
                  color: Themes.primary,
                ),
                const SizedBox(width: 16),
                AnnouncementSubscriptionCard(
                  subscribeName: 'Standard',
                  price: 250,
                  features: const [
                    'feature',
                    'feature',
                    'feature',
                  ],
                  color: Themes.third,
                ),
                const SizedBox(width: 16),
                const AnnouncementSubscriptionCard(
                  subscribeName: 'Basic',
                  price: 100,
                  features: [
                    'feature',
                    'feature',
                  ],
                  color: Colors.grey,
                ),
                const SizedBox(width: 16),
                const AnnouncementSubscriptionCard(
                  subscribeName: 'Basic',
                  price: 200,
                  features: ['feature'],
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
          // Expanded(
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: ListView(
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
          //             const SizedBox(height: 16),
          //             const AnnouncementSubscriptionCard(
          //               subscribeName: 'Basic',
          //               price: 100,
          //               features: [
          //                 'feature',
          //                 'feature',
          //               ],
          //               color: Colors.grey,
          //             ),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(width: 16),
          //       Expanded(
          //         child: ListView(
          //           children: [
          //             const AnnouncementSubscriptionCard(
          //               subscribeName: 'Basic',
          //               price: 200,
          //               features: ['feature'],
          //               color: Colors.grey,
          //             ),
          //             const SizedBox(height: 16),
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
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
