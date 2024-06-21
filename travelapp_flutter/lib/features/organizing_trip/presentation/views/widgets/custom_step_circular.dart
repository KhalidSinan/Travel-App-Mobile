import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomStepCircular extends StatelessWidget {
  const CustomStepCircular({super.key, required this.progress, required this.text});
  final double progress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 20,
      lineWidth: 5,
      percent: progress,
      center: Text(text),
      progressColor: Themes.third,
      animation: true,
      animationDuration: 1000,
      animateFromLastPercent: true,
    );
  }
}
