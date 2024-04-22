import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  RangeValues prices = const RangeValues(0, 2000);
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
              '(${prices.start.toInt()}\$ - ${prices.end.toInt()}\$)',
              style: Styles.content,
            ),
          ],
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: prices,
          labels: labels,
          min: 0,
          max: 2000,
          divisions: 20,
          activeColor: Colors.grey,
          onChanged: (newValue) {
            setState(() {
              prices = newValue;
            });
          },
        ),
      ],
    );
  }
}
