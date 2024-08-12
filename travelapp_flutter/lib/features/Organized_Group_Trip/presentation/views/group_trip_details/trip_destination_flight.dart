import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/flight.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/one_way_flight_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/one_way_ticket.dart';

class TripDestinationFlight extends StatelessWidget {
  const TripDestinationFlight({
    super.key,
    required this.ticket,
  });

  final OneWayFlightModel ticket;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(FontAwesomeIcons.ticket),
            const SizedBox(width: 12),
            Text(
              'Ticket:',
              style: Styles.heading2.copyWith(color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 8),
        OneWayTicket(
          flight: ticket,
          enable: false,
        ),
      ],
    );
  }
}
