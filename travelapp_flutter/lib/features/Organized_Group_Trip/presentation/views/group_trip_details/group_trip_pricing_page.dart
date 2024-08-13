import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/dash_line_divider.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/destination_pricing_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/3_travel_destinations_page.dart';

class GroupTripPricingPage extends StatelessWidget {
  const GroupTripPricingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final groupTrip = BlocProvider.of<GroupTripDetailsCubit>(context).groupTrip;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '(${groupTrip!.participants}/${groupTrip.overallSeats})',
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
                  ...List.generate(
                    groupTrip.destinations.length,
                    (index) {
                      return Column(
                        children: [
                          DestinationPricingCard(
                            destination: groupTrip.destinations[index],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: DashLineDivider(),
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trip Cost',
                        style: Styles.content,
                      ),
                      Text(
                        '\$${groupTrip.price}',
                        style: Styles.content,
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Total Cost With Commission',
                          style: Styles.content,
                        ),
                      ),
                      Text(
                        '\$${groupTrip.priceWithCommission}',
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
