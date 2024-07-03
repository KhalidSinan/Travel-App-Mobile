
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/2_date_selection_widgets/step_two_body.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizingTripCubit, OrganizingTripStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Step 2/8',
                  style: TextStyle(color: Themes.primary, fontSize: 22),
                ),
              ),
              const CustomStepCircular(
                progress: 0.25,
                text: '2/8',
              ),
              const SizedBox(width: 15)
            ],
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            leading: const CustomBackButton(),
          ),
          body: const SafeArea(child: StepTwoBody()),
        );
      },
    );
  }
}
