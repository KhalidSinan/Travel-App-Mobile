import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomStepCircular extends StatelessWidget {
  const CustomStepCircular({super.key, required this.progress});
  final double progress;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 16,
      lineWidth: 5,
      percent: progress,
      progressColor: Themes.third,
      animation: true,
      animationDuration: 1000,
      animateFromLastPercent: true,
    );
  }
}
