import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/themes.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    super.key,
    required this.date,
    required this.isCurrent,
  });
  final DateTime date;
  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    List<String> weekDays = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];
    return Expanded(
      flex: isCurrent ? 2 : 1,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isCurrent ? Themes.primary : const Color(0xffffb156),
          borderRadius: BorderRadius.circular(radius),
          border: isCurrent
              ? Border.all(
                  color: const Color(0xffffb156),
                  width: 3,
                )
              : null,
        ),
        child: Column(
          children: [
            Text(
              weekDays[date.weekday - 1],
              style: Styles.subtitle.copyWith(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            Text(
              '${date.day}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
