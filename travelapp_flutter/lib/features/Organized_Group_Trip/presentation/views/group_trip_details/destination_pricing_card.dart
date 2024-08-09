import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class DestinationPricingCard extends StatelessWidget {
  const DestinationPricingCard({super.key, required this.destination});

  final String destination;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          destination,
          style: Styles.content.copyWith(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        costRow(
          rowName: 'Ticket Cost',
          cost: '300',
        ),
        costRow(
          rowName: 'Hotel Cost',
          cost: '400',
        ),
        costRow(
          rowName: 'Activities Cost',
          cost: '200',
        ),
        costRow(
          rowName: 'Total',
          cost: '900',
          total: true,
        ),
      ],
    );
  }

  Padding costRow(
      {required String rowName, required String cost, bool total = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            rowName,
            style: !total
                ? Styles.subtitle
                : Styles.content.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
          ),
          Text(
            '\$$cost',
            style: !total
                ? Styles.subtitle
                : Styles.content.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
          ),
        ],
      ),
    );
  }
}
