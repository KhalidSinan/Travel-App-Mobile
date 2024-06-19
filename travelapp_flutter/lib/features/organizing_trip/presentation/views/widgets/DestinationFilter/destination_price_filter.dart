import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class DestinationPriceFilter extends StatefulWidget {
  const DestinationPriceFilter({super.key});

  @override
  State<DestinationPriceFilter> createState() => _DestinationPriceFilterState();
}

class _DestinationPriceFilterState extends State<DestinationPriceFilter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(" 0", "3000"
        // prices.start.toInt().toString(),
        //  prices.end.toInt().toString(),
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
              '(${0}\$ - ${3000}\$)',
              style: Styles.content,
            ),
          ],
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: RangeValues(0, 3000),
          labels: labels,
          min: 0,
          max: 3000,
          divisions: 30,
          activeColor: Colors.grey,
          onChanged: (newValue) {
            setState(() {
              print(newValue);
              //prices = newValue;
            });
          },
        ),
      ],
    );
  }
}
