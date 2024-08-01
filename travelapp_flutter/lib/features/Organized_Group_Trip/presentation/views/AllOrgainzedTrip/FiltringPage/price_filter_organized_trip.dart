import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class PriceFilterTripGroup extends StatefulWidget {
  const PriceFilterTripGroup({super.key});

  @override
  State<PriceFilterTripGroup> createState() => _PriceFilterTripGroupState();
}

class _PriceFilterTripGroupState extends State<PriceFilterTripGroup> {
  // late RangeValues prices;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = const RangeLabels(
      "100",
      "3000",
    );
    return Column(
      children: [
        Row(
          children: [
            Text('Select Price:',
                style: Styles.heading2.copyWith(color: Colors.black)),
            const SizedBox(width: 16),
            Text(
              '(${"10"}\$ - ${"3000"}\$)',
              style: Styles.content,
            ),
          ],
        ),
        const SizedBox(height: 8),
        RangeSlider(
          values: RangeValues(50, 3000),
          labels: labels,
          min: 10,
          max: 3000,
          divisions: 30,
          activeColor: Colors.grey,
          onChanged: (newValue) {
            setState(() {
              // prices = newValue;
            });
          },
        ),
      ],
    );
  }
}
