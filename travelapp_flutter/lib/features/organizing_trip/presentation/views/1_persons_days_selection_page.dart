// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/persons_days_selection_body.dart';

class PersonsDaysSelection extends StatelessWidget {
  const PersonsDaysSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CustomStepCircular(progress: 0.125, text: '1/8'),
          SizedBox(width: 15)
        ],
        leading: const CustomBackButton(),
      ),
      body: const SafeArea(
        child: PersonsDaysSelectionBody(),
      ),
    );
  }
}
