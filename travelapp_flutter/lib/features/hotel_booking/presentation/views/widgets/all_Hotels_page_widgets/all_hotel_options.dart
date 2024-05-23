import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/filter_hotel_sheet.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/sort_hotel_sheet.dart';

class AllHotelsOptions extends StatelessWidget {
  const AllHotelsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.bottomSheet(
              const FilterHotelSheet(),
            );
          },
          style: IconButton.styleFrom(),
          icon: Icon(
            FontAwesomeIcons.filter,
            color: Themes.third,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            Get.bottomSheet(
              const SortHotelSheet(),
            );
          },
          icon: Icon(
            FontAwesomeIcons.sliders,
            color: Themes.third,
          ),
        ),
      ],
    );
  }
}
