import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';

import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/number_persons_days_page_body.dart';

class NumberPersonsDaysPage extends StatelessWidget {
  const NumberPersonsDaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          const CustomStepCircular(progress: 0.125 , text: '1/8',),
          const SizedBox(width: 15)
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const CustomBackButton(),
      ),
      body: const SafeArea(
        child: NumberPersonsDaysPageBody(),
      ),
    );
  }
}