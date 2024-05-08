import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/time_picker.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';

class TimeFilter extends StatefulWidget {
  const TimeFilter({super.key});

  @override
  State<TimeFilter> createState() => _TimeFilterState();
}

class _TimeFilterState extends State<TimeFilter> {
  String? startTime;
  String? endTime;

  @override
  void initState() {
    super.initState();
    startTime = BlocProvider.of<AllFlightsCubit>(context).timeStart;
    endTime = BlocProvider.of<AllFlightsCubit>(context).timeEnd;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'By Time',
              style: Styles.heading2,
            ),
            IconButton(
              onPressed: restartTime,
              icon: const Icon(
                FontAwesomeIcons.repeat,
                size: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = await showCustomTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  String formattedTime = formatTime(pickedTime);
                  setState(() {
                    startTime = formattedTime;
                    BlocProvider.of<AllFlightsCubit>(context).timeStart =
                        startTime;
                  });
                }
              },
              child: Text(
                // '${startTime.hour}:${startTime.minute}',
                startTime ?? '00:00',
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
                  initialTime: const TimeOfDay(hour: 1, minute: 40),
                );
                if (pickedTime != null) {
                  String formattedTime = formatTime(pickedTime);
                  setState(() {
                    endTime = formattedTime;
                    BlocProvider.of<AllFlightsCubit>(context).timeEnd = endTime;
                  });
                }
              },
              child: Text(
                // '${startTime.hour}:${startTime.minute}',
                endTime ?? '00:00',
                style: Styles.content.copyWith(fontSize: 24),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String formatTime(TimeOfDay pickedTime) {
    // format time from 24-hour clock to 12-hour clock
    DateTime now = DateTime.now();
    DateTime selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      pickedTime.hour,
      pickedTime.minute,
    );
    return DateFormat('hh:mm a').format(selectedDateTime);
  }

  void restartTime() {
    BlocProvider.of<AllFlightsCubit>(context).timeStart = null;
    BlocProvider.of<AllFlightsCubit>(context).timeEnd = null;
    startTime = null;
    endTime = null;
    setState(() {});
  }
}
