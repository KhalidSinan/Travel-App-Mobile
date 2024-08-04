import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';

class AnnouncementSubscriptionCard extends StatelessWidget {
  const AnnouncementSubscriptionCard({
    super.key,
    required this.subscribeName,
    required this.price,
    required this.features,
    required this.color,
  });
  final String subscribeName;
  final double price;
  final List<String> features;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width - 80,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(-3, 3),
                blurRadius: 4,
              )
            ],
            color: Themes.secondary,
          ),
          child: Column(
            children: [
              // header
              cardHeader(subscribeName, price),
              // features
              cardFeatures(features),
              // button
              const Spacer(),
              cardSubscribeButton(),
            ],
          ),
        ),
        Positioned(
          top: -30,
          right: 8,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: color,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(radius))),
            child: const Icon(FontAwesomeIcons.check, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget cardHeader(String subscribeName, double price) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: color),
      child: Column(
        children: [
          Text(
            subscribeName,
            style: Styles.heading2.copyWith(color: Colors.white, fontSize: 32),
          ),
          Text(
            '\$${price.ceil()}',
            style: Styles.heading.copyWith(color: Colors.white, fontSize: 24),
          ),
        ],
      ),
    );
  }

  Widget cardFeatures(List<String> features) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Themes.secondary),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(features.length, (index) {
            return createFeature(features[index]);
          })),
    );
  }

  Wrap createFeature(String feature) {
    return Wrap(
      children: [
        Icon(
          FontAwesomeIcons.check,
          size: 16,
          color: Themes.primary,
        ),
        const SizedBox(width: 4),
        Text(
          feature,
          style: Styles.content.copyWith(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }

  Widget cardSubscribeButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        onPressed: () {},
        color: color,
        label: "Subscribe",
        isFlat: true,
      ),
    );
  }
}
