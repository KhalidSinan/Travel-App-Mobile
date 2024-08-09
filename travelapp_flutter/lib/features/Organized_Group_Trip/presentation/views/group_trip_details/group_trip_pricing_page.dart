import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/dash_line_divider.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/destination_pricing_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/3_travel_destinations_page.dart';

class GroupTripPricingPage extends StatelessWidget {
  const GroupTripPricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '(7/20)',
                  style: Styles.heading.copyWith(color: Themes.third),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Participants',
                  style: Styles.subtitle,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.moneyBill1,
                  color: Themes.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  'Pricing',
                  style: Styles.heading,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                color: Themes.secondary,
                borderRadius: BorderRadius.circular(radius),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(-2, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  const DestinationPricingCard(
                    destination: 'Damascus',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: DashLineDivider(),
                  ),
                  const DestinationPricingCard(
                    destination: 'Asyut',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: DashLineDivider(),
                  ),
                  const DestinationPricingCard(
                    destination: 'Asyut',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: DashLineDivider(),
                  ),
                  const DestinationPricingCard(
                    destination: 'Asyut',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: DashLineDivider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trip Cost',
                        style: Styles.content,
                      ),
                      Text(
                        '\$1800',
                        style: Styles.content,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
