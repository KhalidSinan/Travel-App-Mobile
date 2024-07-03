

import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/persons_days_selection_body.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Step 1/8',
              style: TextStyle(color: Themes.primary, fontSize: 22),
            ),
          ),
          const CustomStepCircular(progress: 0.125,text: '1/8',),
          const SizedBox(width: 15)
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const CustomBackButton(),
      ),
      body:  const SafeArea(
        child: StepOneBody(),
      ),
    );
  }
}
