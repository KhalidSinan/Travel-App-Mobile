import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
class SortSheet extends StatefulWidget {
  const SortSheet({super.key});

  @override
  State<SortSheet> createState() => _SortSheetState();
}

class _SortSheetState extends State<SortSheet> {
  List<String> sortBy = [
    'none',
    'time_asc',
    'time_desc',
    'price_asc',
    'price_desc'
  ];
  List<String> titles = [
    'None',
    'Time: Close to Far',
    'Time: Far to Close',
    'Price: Low to High',
    'Price: High to Low',
  ];
  String currentSortBy = 'none';
  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(5, (index) {
            return RadioListTile(
                title: Text(
                  titles[index],
                  style: Styles.content.copyWith(color: Themes.primary),
                ),
                selected: currentSortBy == sortBy[index],
                activeColor: Themes.third,
                value: sortBy[index],
                groupValue: currentSortBy,
                onChanged: (value) {
                  setState(() {
                    currentSortBy = value.toString();
                  });
                });
          }),
          const Spacer(flex: 1),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {},
              label: 'Apply Sorting',
            ),
          ),
        ],
        // const PriceSort(),
        // const SizedBox(height: 24),
        // const TimeSort(),
        // const Spacer(flex: 1),
        // SizedBox(
        //   width: double.infinity,
        //   child: CustomButton(
        //     onPressed: () {},
        //     label: 'Apply Sorting',
        //   ),
        // ),
      ),
    );
  }
}
