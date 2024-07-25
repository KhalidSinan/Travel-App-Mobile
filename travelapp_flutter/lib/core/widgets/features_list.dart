import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/custom_tag.dart';

// ignore: must_be_immutable
class FeaturesList extends StatelessWidget {
  FeaturesList({
    super.key,
    required this.features,
    required this.getFeatures,
    this.roomTag,
  });
  bool? roomTag;
  final List<String>? features;
  final IconData? Function(String feature) getFeatures;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: features!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CustomTag(
              roomTag: roomTag,
              text: features![index],
              icon: getFeatures(features![index]),
            ),
          );
        },
      ),
    );
  }
}
