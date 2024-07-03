import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/3_travel_destinations_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/2_date_selection_widgets/custom_table_calendar.dart';

class DateSelectionPageBody extends StatelessWidget {
  const DateSelectionPageBody({super.key});
 @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Select begin date to your trip !',
              style:
                  Styles.heading2.copyWith(color: Themes.third, fontSize: 25),
            ),
          ),
          const SizedBox(height: 30),
          const CustomTableCalendar(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          NextButton(onTap: () {
            Get.to(const StepThree());
          })
        ],
      ),
    );
  }
}
