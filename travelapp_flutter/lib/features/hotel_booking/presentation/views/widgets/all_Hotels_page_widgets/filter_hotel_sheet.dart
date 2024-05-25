import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';

class FilterHotelSheet extends StatefulWidget {
  const FilterHotelSheet({
    super.key,
  });

  @override
  State<FilterHotelSheet> createState() => _FilterHotelSheetState();
}

class _FilterHotelSheetState extends State<FilterHotelSheet> {
  double rating = 1;
  @override
  Widget build(BuildContext context) {
    return CustomSheet(
        height: 250,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Filter By Stars',
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
            const SizedBox(
              height: 8,
            ),
            Center(
              child: RatingBar.builder(
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemSize: 46,
                minRating: rating,
                itemBuilder: (BuildContext context, int index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (double value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
            ),
            const Spacer(flex: 1),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {},
                label: 'Apply Filtering',
              ),
            ),
          ],
        ));
  }
}
