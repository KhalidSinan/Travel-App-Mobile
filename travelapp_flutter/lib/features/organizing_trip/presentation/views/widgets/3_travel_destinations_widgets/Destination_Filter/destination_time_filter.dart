import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/time_picker.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';

class DestinationTimeFilter extends StatefulWidget {
  const DestinationTimeFilter({super.key, required this.index});
  final int index;
  @override
  State<DestinationTimeFilter> createState() => _DestinationTimeFilterState();
}

class _DestinationTimeFilterState extends State<DestinationTimeFilter> {
  String? startTime;
  String? endTime;

  @override
  void initState() {
    super.initState();
    startTime = BlocProvider.of<OrganizingTripCubit>(context)
        .destinations[widget.index]
        .filter
        ?.timeStart;
    endTime = BlocProvider.of<OrganizingTripCubit>(context)
        .destinations[widget.index]
        .filter
        ?.timeEnd;
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
                    BlocProvider.of<OrganizingTripCubit>(context)
                        .destinations[widget.index]
                        .filter
                        ?.timeStart = startTime;
                  });
                }
              },
              child: Text(
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
                    BlocProvider.of<OrganizingTripCubit>(context)
                        .destinations[widget.index]
                        .filter
                        ?.timeEnd = endTime;
                  });
                }
              },
              child: Text(
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
    BlocProvider.of<OrganizingTripCubit>(context)
        .destinations[widget.index]
        .filter
        ?.timeStart = null;
    BlocProvider.of<OrganizingTripCubit>(context)
        .destinations[widget.index]
        .filter
        ?.timeEnd = null;
    startTime = null;
    endTime = null;
    setState(() {});
  }
}
