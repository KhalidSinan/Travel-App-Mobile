import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/step_two_widgets/custom_table_calendar.dart';

class StepTwoBody extends StatelessWidget {
  const StepTwoBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Select begin your trip !',
              style:
                  Styles.heading2.copyWith(color: Themes.third, fontSize: 25),
            ),
          ),
          const SizedBox(height: 30),
          const CustomTableCalendar(),
          const SizedBox(height: 40),
          NextButton(onTap: () {})
        ],
      ),
    );
  }
}
