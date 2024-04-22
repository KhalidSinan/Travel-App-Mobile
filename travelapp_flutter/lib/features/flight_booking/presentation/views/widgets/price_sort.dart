import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/segmented_button_style.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class PriceSort extends StatefulWidget {
  const PriceSort({super.key});

  @override
  State<PriceSort> createState() => _PriceSortState();
}

class _PriceSortState extends State<PriceSort> {
  List<String> sortPriceBy = ['none', 'asc', 'desc'];
  Set<String> currentPrice = {'none'};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sort By Price',
          style: Styles.heading2,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton(
            selected: currentPrice,
            segments: getPriceSortButtons,
            style: getButtonStyle(),
            onSelectionChanged: onPriceSortByChanged,
          ),
        )
      ],
    );
  }

  List<ButtonSegment<String>> get getPriceSortButtons {
    return [
      ButtonSegment(
        value: sortPriceBy[0],
        label: const Text("None"),
      ),
      ButtonSegment(
        value: sortPriceBy[1],
        label: const Text("Lower"),
        icon: const Icon(FontAwesomeIcons.sortDown),
      ),
      ButtonSegment(
        value: sortPriceBy[2],
        label: const Text("Higher"),
        icon: const Icon(FontAwesomeIcons.sortUp),
      ),
    ];
  }

  void onPriceSortByChanged(value) {
    setState(() {
      currentPrice = value;
    });
  }
}
