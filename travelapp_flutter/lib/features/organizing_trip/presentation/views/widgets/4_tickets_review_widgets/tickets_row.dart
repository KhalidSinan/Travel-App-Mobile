import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/available_flight_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/filtering_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/4_tickets_review_widgets/ticket_card.dart';

class TicketsRow extends StatelessWidget {
  const TicketsRow({super.key, required this.flightData, required this.filters});
  final AvailableFlightModel flightData;
  final FilterModel? filters;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TicketCard(flightData: flightData, filters:filters),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Icon(
                    size: 42,
                    color: flightData.reason == 'Flights Available'
                        ? Themes.primary
                        : flightData.reason == 'No Flights Available'
                            ? Colors.grey[700]
                            : Themes.third,
                    flightData.reason == 'Flights Available'
                        ? Icons.check_circle_outline
                        : flightData.reason == 'No Flights Available'
                            ? Icons.error_outline
                            : Icons.highlight_off,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
