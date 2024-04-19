import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/themes.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    super.key,
    required this.weekDays,
    required this.dayNumber,
  });
  final int dayNumber;
  final List<String> weekDays;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Themes.primary,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        children: [
          Text(
            weekDays[dayNumber % 7],
            style: Styles.subtitle.copyWith(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          Text(
            '${dayNumber + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}