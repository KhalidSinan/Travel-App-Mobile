import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/filter_sheet.dart';

class AllFlightsOptions extends StatelessWidget {
  const AllFlightsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.bottomSheet(const FilterSheet());
          },
          style: IconButton.styleFrom(),
          icon: Icon(
            FontAwesomeIcons.filter,
            color: Themes.third,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.sliders,
            color: Themes.third,
          ),
        ),
      ],
    );
  }
}
