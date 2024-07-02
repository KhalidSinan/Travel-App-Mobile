import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
<<<<<<<< HEAD:travelapp_flutter/lib/features/organizing_trip/presentation/views/widgets/dateSelection/date_selection_page_body.dart
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/dateSelection/custom_table_calendar.dart';

class DateSelectionPageBody extends StatelessWidget {
  const DateSelectionPageBody({super.key});
========
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/3_travel_destination.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/2_date_selection_widgets/custom_table_calendar.dart';

class DateSelectionBody extends StatelessWidget {
  const DateSelectionBody({super.key});
>>>>>>>> f9022ec8f06acb804a4fe167e758fe140e5ff259:travelapp_flutter/lib/features/organizing_trip/presentation/views/widgets/2_date_selection_widgets/date_selection_body.dart
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
