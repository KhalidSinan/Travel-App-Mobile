import 'package:flutter/cupertino.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/destination_filter_widgets/destination_airline_filter.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/destination_filter_widgets/destination_price_filter.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/destination_filter_widgets/destination_time_filter.dart';

class DestinationsFilterBody extends StatelessWidget {
  const DestinationsFilterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const DestinationPriceFilter(),
          const SizedBox(height: 64),
          const DestinationAirlineFilter(),
          const SizedBox(height: 64),
          const DestinationTimeFilter(),
          const SizedBox(height: 64),
          const Spacer(flex: 1),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {},
              label: 'Apply Filters',
            ),
          ),
        ],
      ),
    );
  }
}
