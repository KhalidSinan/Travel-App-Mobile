import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/airline_filter.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/price_filter.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/time_filter.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({
    super.key,
  });

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PriceFilter(),
          const SizedBox(height: 16),
          const AirlineFilter(),
          const SizedBox(height: 16),
          const TimeFilter(),
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
