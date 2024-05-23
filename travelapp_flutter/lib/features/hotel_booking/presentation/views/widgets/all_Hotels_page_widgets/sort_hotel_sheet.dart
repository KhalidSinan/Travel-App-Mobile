import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';

class SortHotelSheet extends StatefulWidget {
  const SortHotelSheet({super.key});

  @override
  State<SortHotelSheet> createState() => _SortHotelSheetState();
}

class _SortHotelSheetState extends State<SortHotelSheet> {
  List<String> sortBy = [
    'price_asc',
    'price_desc',
    'Least rated',
    'Most rated',
  ];
  List<String> titles = [
    ' Price Low to High',
    ' Price High to Low',
    ' Least rated',
    ' Most rated',
  ];
  String? currentSortBy;
  @override
  Widget build(BuildContext context) {
    double rating;
    return CustomSheet(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Sort By ',
                style: Styles.heading2,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.repeat,
                  size: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          ...List.generate(sortBy.length, (index) {
            return RadioListTile(
                title: Text(
                  titles[index],
                  style: Styles.content.copyWith(color: Colors.grey),
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
          // Row(
          //   children: [
          //     Text(
          //       'Sort By Stars',
          //       style: Styles.heading2,
          //     ),
          //     IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         FontAwesomeIcons.repeat,
          //         size: 16,
          //         color: Colors.grey,
          //       ),
          //     ),
          //   ],
          // ),
          // CustomSheet(
          //     height: 100,
          //     child: Center(
          //       child: RatingBar.builder(
          //         itemPadding: const EdgeInsets.symmetric(horizontal: 4),
          //         itemSize: 46,
          //         minRating: 1,
          //         itemBuilder: (BuildContext context, int index) => const Icon(
          //           Icons.star,
          //           color: Colors.amber,
          //         ),
          //         onRatingUpdate: (double value) {
          //           setState(() {
          //             rating = value;
          //           });
          //         },
          //       ),
          //     )),
          const Spacer(flex: 1),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {},
              label: 'Apply Sorting',
            ),
          ),
        ],
      ),
    );
  }
}
