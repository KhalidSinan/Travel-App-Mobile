import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/content_of_step.dart';

class ScheduleViewContent extends StatefulWidget {
  const ScheduleViewContent(
      {super.key,
      required this.tabController,
      required this.cities,
      required this.currentSteps,
      required this.city,
      required this.index,
      this.navigateToNextCity});

  final TabController tabController;
  final List<DestinationsModel> cities;
  final List<int> currentSteps;
  final DestinationsModel city;
  final int index;
  final navigateToNextCity;
  @override
  State<ScheduleViewContent> createState() => _ScheduleViewContentState();
}

class _ScheduleViewContentState extends State<ScheduleViewContent> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(colorScheme: ColorScheme.light(primary: Themes.primary)),
      child: Stepper(
        type: StepperType.vertical,
        steps: createSteps(widget.city.days, widget.index),
        currentStep: widget.currentSteps[widget.index],
        onStepContinue: () => onStepContinue(widget.index),
        onStepCancel: () => onStepCancel(widget.index),
        onStepTapped: (step) => onStepTapped(step, widget.index),
        controlsBuilder: (context, ControlsDetails details) =>
            controlsBuilder(details, widget.index),
      ),
    );
  }

  Widget controlsBuilder(ControlsDetails details, int cityIndex) {
    if (widget.currentSteps[cityIndex] == widget.city.days - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Themes.primary,
              ),
              onPressed: () {
                widget.tabController.index = cityIndex;
                widget.tabController.animateTo(cityIndex);
                widget.navigateToNextCity();
              },
              child: (cityIndex == widget.cities.length - 1 &&
                      widget.currentSteps[cityIndex] == widget.city.days - 1)
                  ? const Text('Finish The Schedule ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                  : const Text(
                      'Next City',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Themes.primary),
              onPressed: () => onStepContinue(cityIndex),
              child: const Text(
                'Continue',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 12),
          if (widget.currentSteps[cityIndex] > 0)
            Expanded(
              child: ElevatedButton(
                onPressed: () => onStepCancel(cityIndex),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Themes.third, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      );
    }
  }

  void onStepTapped(int step, int cityIndex) {
    setState(() {
      widget.currentSteps[cityIndex] = step;
    });
  }

  void onStepCancel(int cityIndex) {
    setState(() {
      widget.currentSteps[cityIndex] =
          max<int>(widget.currentSteps[cityIndex] - 1, 0);
    });
  }

  void onStepContinue(int cityIndex) {
    int nextStep = min<int>(widget.currentSteps[cityIndex] + 1,
        createSteps(widget.cities[cityIndex].days, cityIndex).length - 1);

    setState(() {
      widget.currentSteps[cityIndex] = nextStep;
    });
  }

  List<Step> createSteps(int days, int cityIndex) {
    List<Step> steps = [];
    for (int i = 0; i < days; i++) {
      steps.add(
        Step(
          title: Text('Day ${i + 1}'),
          content: ContentOfStep(
            i: i,
            city: widget.city.city,
            step: widget.currentSteps[cityIndex],
          ),
          isActive: i <= widget.currentSteps[cityIndex],
          state: i < widget.currentSteps[cityIndex]
              ? StepState.complete
              : StepState.indexed,
        ),
      );
    }
    return steps;
  }
}
