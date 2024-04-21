import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/time_picker.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';

class TimeFilter extends StatefulWidget {
  const TimeFilter({super.key});

  @override
  State<TimeFilter> createState() => _TimeFilterState();
}

class _TimeFilterState extends State<TimeFilter> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = const TimeOfDay(hour: 12, minute: 30);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'By Time',
          style: Styles.heading2,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = await showCustomTimePicker(
                  context: context,
                  initialTime: startTime,
                );
                if (pickedTime != null) {
                  setState(() {
                    startTime = pickedTime;
                  });
                }
              },
              child: Text(
                '${startTime.hour}:${startTime.minute}',
                style: Styles.content.copyWith(fontSize: 24),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey[400],
                indent: 20,
                endIndent: 20,
                thickness: 3,
              ),
            ),
            GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = await showCustomTimePicker(
                  context: context,
                  initialTime: endTime,
                );
                if (pickedTime != null) {
                  setState(() {
                    endTime = pickedTime;
                  });
                }
              },
              child: Text(
                '${startTime.hour}:${startTime.minute}',
                style: Styles.content.copyWith(fontSize: 24),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
