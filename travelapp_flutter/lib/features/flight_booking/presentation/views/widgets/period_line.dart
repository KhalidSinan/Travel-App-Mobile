import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class PeriodLine extends StatelessWidget {
  const PeriodLine({
    super.key,
    required this.period,
  });

  final String period;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            period,
            style: Styles.subtitle.copyWith(
              // color: Colors.white54,
              color: Colors.black54,
            ),
          ),
          Divider(
            color: Themes.primary,
            indent: 10,
            endIndent: 10,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
