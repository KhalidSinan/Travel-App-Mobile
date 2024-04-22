import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/segmented_button_style.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class TimeSort extends StatefulWidget {
  const TimeSort({super.key});

  @override
  State<TimeSort> createState() => _TimeSortState();
}

class _TimeSortState extends State<TimeSort> {
  List<String> sortTimeBy = ['none', 'asc', 'desc'];
  Set<String> currentTime = {'none'};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sort By Time',
          style: Styles.heading2,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton(
            selected: currentTime,
            segments: getTimeSortButtons,
            style: getButtonStyle(),
            onSelectionChanged: onTimeSortByChanged,
          ),
        ),
      ],
    );
  }

  List<ButtonSegment<String>> get getTimeSortButtons {
    return [
      ButtonSegment(
        value: sortTimeBy[0],
        label: const Text("None"),
      ),
      ButtonSegment(
        value: sortTimeBy[1],
        label: const Text("Closest"),
        icon: const Icon(FontAwesomeIcons.sortDown),
      ),
      ButtonSegment(
        value: sortTimeBy[2],
        label: const Text("Farthest"),
        icon: const Icon(FontAwesomeIcons.sortUp),
      ),
    ];
  }

  void onTimeSortByChanged(value) {
    setState(() {
      currentTime = value;
    });
  }
}
