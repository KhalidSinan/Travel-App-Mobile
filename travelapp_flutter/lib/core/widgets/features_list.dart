import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/widgets/custom_tag.dart';

class FeaturesList extends StatelessWidget {
  const FeaturesList({
    super.key,
    required this.features,
    required this.getFeatures,
  });

  final List<String>? features;
  final IconData? Function(String feature) getFeatures;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: features!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 25),
            child: CustomTag(
              text: features![index],
              icon: getFeatures(features![index]),
            ),
          );
        },
      ),
    );
  }
}
