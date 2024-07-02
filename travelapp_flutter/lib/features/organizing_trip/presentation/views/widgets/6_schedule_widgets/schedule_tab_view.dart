import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';


class ScheduleTabbarView extends StatefulWidget {
  const ScheduleTabbarView(
      {super.key,
      required this.tabController,
      required this.cities,
      required this.currentSteps});

  final TabController tabController;
  final List cities;
  final List currentSteps;

  @override
  State<ScheduleTabbarView> createState() => _ScheduleTabbarViewState();
}

class _ScheduleTabbarViewState extends State<ScheduleTabbarView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(
      controller: widget.tabController,
      children: widget.cities
          .asMap()
          .map((index, city) => MapEntry(
              index,
              MyChild(
                index: index,
                city: city,
                cities: widget.cities,
                currentSteps: widget.currentSteps,
                tabController: widget.tabController,
              )))
          .values
          .toList(),
    ));
  }
}

class MyChild extends StatefulWidget {
  const MyChild(
      {super.key,
      required this.tabController,
      required this.cities,
      required this.currentSteps,
      this.city, this.index});

  final TabController tabController;
  final List cities;
  final List currentSteps;
  final city;
  final index;

  @override
  State<MyChild> createState() => _MyChildState();
}

class _MyChildState extends State<MyChild> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(colorScheme: ColorScheme.light(primary: Themes.primary)),
      child: Stepper(
        type: StepperType.vertical,
        steps: createSteps(widget.city['days'], widget.index), // Pass index
        currentStep: widget.currentSteps[widget.index],
        onStepContinue: () => onStepContinue(widget.index), // Pass index
        onStepCancel: () => onStepCancel(widget.index), // Pass index
        onStepTapped: (step) => onStepTapped(step, widget.index), // Pass index
        controlsBuilder: (context, ControlsDetails details) =>
            controlsBuilder(details, widget.index),
      ),
    );
  }

  Widget controlsBuilder(ControlsDetails details, int cityIndex) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => onStepContinue(cityIndex),
            child: const Text('Continue'),
          ),
        ),
        const SizedBox(width: 12),
        if (widget.currentSteps[cityIndex] > 0)
          Expanded(
            child: ElevatedButton(
              onPressed: () => onStepCancel(cityIndex),
              child: const Text('Cancel'),
            ),
          ),
      ],
    );
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
        createSteps(widget.cities[cityIndex]['days'], cityIndex).length - 1);

    setState(() {
      widget.currentSteps[cityIndex] = nextStep;
    });
  }

  List<Step> createSteps(int days, int cityIndex) {
    List<Step> steps = [];
    for (int i = 0; i < days; i++) {
      steps.add(
        Step(
          title: Text('Day ${i + 1}'), // Example title
          content: Text('Step ${i + 1} Content'), // Example content
          isActive: i <= widget.currentSteps[cityIndex], // Update isActive
          state: i < widget.currentSteps[cityIndex]
              ? StepState.complete
              : StepState.indexed, // Update state
        ),
      );
    }
    return steps;
  }
}



