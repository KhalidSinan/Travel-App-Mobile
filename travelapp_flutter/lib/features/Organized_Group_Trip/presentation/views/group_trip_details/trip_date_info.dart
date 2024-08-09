import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class TripDateInfo extends StatelessWidget {
  const TripDateInfo({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.days,
  });

  final String startDate;
  final String endDate;
  final String days;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            dateBox(date: startDate),
            Expanded(
              child: horizontalLine(),
            ),
            dateBox(
              date: endDate,
              end: true,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.center,
          child: Text(
            '$days Days',
            style: Styles.subtitle,
          ),
        ),
      ],
    );
  }

  Container horizontalLine() {
    return Container(
      height: 20,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Themes.secondary,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 3),
          )
        ],
      ),
    );
  }

  Container dateBox({required String date, bool end = false}) {
    final shadowDirection = end ? 3.0 : -3.0;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Themes.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(!end ? radius : 0),
          topLeft: Radius.circular(!end ? radius : 0),
          topRight: Radius.circular(end ? radius : 0),
          bottomRight: Radius.circular(end ? radius : 0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(shadowDirection, 3),
          )
        ],
      ),
      child: Text(
        date,
        style: Styles.content,
      ),
    );
  }
}
