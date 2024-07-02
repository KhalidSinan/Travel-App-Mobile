import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/4_tickets_review_widgets/ticket_card.dart';

class TicketsRow extends StatelessWidget {
  const TicketsRow({super.key, required this.state});
  final String state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TicketCard(state: state),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Icon(
                    size: 42,
                    color: state == 'yes'
                        ? Themes.primary
                        : state == 'no'
                            ? Themes.third
                            : Colors.grey[700],
                    state == 'yes'
                        ? Icons.check_circle_outline
                        : state == 'no'
                            ? Icons.highlight_off
                            : Icons.error_outline,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
