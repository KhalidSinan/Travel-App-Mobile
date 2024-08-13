import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/trip_destination_model.dart';

class DestinationPricingCard extends StatelessWidget {
  const DestinationPricingCard({super.key, required this.destination});
  final TripDestinationModel destination;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          destination.destination.city,
          style: Styles.content.copyWith(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        costRow(
          rowName: 'Ticket Cost',
          cost: destination.ticket.flightPrice.toString(),
        ),
        costRow(
          rowName: 'Hotel Cost',
          cost: destination.hotel.startsFrom.toString(),
        ),
        costRow(
          rowName: 'Total',
          cost: destination.price,
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
