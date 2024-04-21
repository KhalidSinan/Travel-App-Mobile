import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/airline_info.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/country_info.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/period_line.dart';

import '../../../../../core/helpers/custom_ticket_shape.dart';
import '../../../../../core/helpers/dashed_line_painter.dart';

class TwoWayTicket extends StatelessWidget {
  const TwoWayTicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomTwoWayTicketShape(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.grey[200],
          border: Border.all(
            color: Themes.primary,
            width: 3,
          ),
        ),
        child: Column(
          children: [
            const AirlineInfo(name: 'Airline Name 1'),
            const SizedBox(height: 16),
            const Row(
              children: [
                CountryInfo(
                  country: 'Khalid',
                  date: '2024-5-12',
                ),
                PeriodLine(
                  period: '2hr 30min',
                ),
                CountryInfo(
                  country: 'Home',
                  date: '2024-5-13',
                ),
              ],
            ),
            const SizedBox(height: 24),
            const AirlineInfo(name: 'Airline Name 2'),
            const SizedBox(height: 16),
            const Row(
              children: [
                CountryInfo(
                  country: 'Home',
                  date: '2024-5-20',
                ),
                PeriodLine(
                  period: '2hr 30min',
                ),
                CountryInfo(
                  country: 'Khalid',
                  date: '2024-5-21',
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomPaint(
              painter: DashedLinePainter(),
              child: Container(),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '6:00PM',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '900\$',
                  style: Styles.heading.copyWith(
                    fontSize: 24,
                    color: Themes.third,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
