// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/2_date_selection_widgets/date_selection_body.dart';

class DateSelection extends StatelessWidget {
  const DateSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CustomStepCircular(
            progress: 0.25,
            text: '2/8',
          ),
          SizedBox(width: 15)
        ],
        leading: const CustomBackButton(),
      ),
      body: const SafeArea(child: DateSelectionBody()),
    );
  }
}
