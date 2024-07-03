

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';

class DestinationPriceFilter extends StatefulWidget {
  const DestinationPriceFilter({super.key, required this.index});
  final int index;
  @override
  State<DestinationPriceFilter> createState() => _DestinationPriceFilterState();
}

class _DestinationPriceFilterState extends State<DestinationPriceFilter> {
  late RangeValues prices;
  @override
  void initState() {
    super.initState();

    prices = RangeValues(
        BlocProvider.of<OrganizingTripCubit>(context)
                .destinations[widget.index]
                .filter
                ?.minPrice ??
            0,
        BlocProvider.of<OrganizingTripCubit>(context)
                .destinations[widget.index]
                .filter
                ?.maxPrice ??
            1500);
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      prices.start.toInt().toString(),
      prices.end.toInt().toString(),
    );
    return Column(
      children: [
        Row(
          children: [
            Text(
              'By Price',
              style: Styles.heading2,
            ),
            const SizedBox(width: 16),
            Text(
              '(${prices.start.toInt()}\$ - ${prices.start.toInt()}\$)',
              style: Styles.content,
            ),
          ],
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: prices,
          labels: labels,
          min: 0,
          max: 1500,
          divisions: 30,
          activeColor: Colors.grey,
          onChanged: (newValue) {
            setState(() {
              prices = newValue;
              BlocProvider.of<OrganizingTripCubit>(context)
                  .destinations[widget.index]
                  .filter
                  ?.minPrice = newValue.start;
              BlocProvider.of<OrganizingTripCubit>(context)
                  .destinations[widget.index]
                  .filter
                  ?.maxPrice = newValue.end;
            });
          },
        ),
      ],
    );
  }
}
