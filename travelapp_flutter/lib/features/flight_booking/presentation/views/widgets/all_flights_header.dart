import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/all_flights_options.dart';

class AllFlightsHeader extends StatelessWidget {
  const AllFlightsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'All Flights',
              style: Styles.heading,
            ),
            const SizedBox(width: 8),
            const Text(
              '(14)',
              style: Styles.subtitle,
            ),
          ],
        ),
        const AllFlightsOptions(),
      ],
    );
  }
}
