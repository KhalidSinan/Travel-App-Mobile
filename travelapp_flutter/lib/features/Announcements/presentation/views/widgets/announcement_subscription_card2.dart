import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/announcements/data/models/announcement_subscription_model.dart';
import 'package:travelapp_flutter/features/announcements/presentation/view_model/announcement_subscription_cubit/announcement_subcription_cubit.dart';

class AnnouncementSubscriptionCard2 extends StatelessWidget {
  const AnnouncementSubscriptionCard2({
    super.key,
    required this.subscription,
    this.selected = false,
  });

  final AnnouncementSubscriptionModel subscription;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<AnnouncementSubscriptionCubit>(context)
                .selectSubscribe(subscription);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Themes.secondary,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: selected ? Themes.primary : Colors.black38,
                width: 4,
              ),
            ),
            child: Row(
              children: [
                Text(
                  '\$${subscription.price}',
                  style: Styles.heading2,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Themes.third,
                      borderRadius: BorderRadius.circular(radius - 2),
                    ),
                    child: Text(
                      'For: ${subscription.getSubscriptionDuration()}',
                      style: Styles.content.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 12,
          top: -6,
          child: Offstage(
            offstage: !selected,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Themes.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Lottie.asset(
                'assets/animations/check.json',
                repeat: false,
              ),
            ),
          ),
        )
      ],
    );
  }
}
