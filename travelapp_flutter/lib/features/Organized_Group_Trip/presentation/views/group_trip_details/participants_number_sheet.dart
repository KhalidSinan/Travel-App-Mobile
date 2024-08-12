import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_oval_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/form_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/scroller.dart';

class ParticipantsNumberSheet extends StatefulWidget {
  const ParticipantsNumberSheet({
    super.key,
    required this.controller,
    required this.onDone,
  });
  final PageController controller;
  final void Function(int participants) onDone;
  @override
  State<ParticipantsNumberSheet> createState() =>
      _ParticipantsNumberSheetState();
}

class _ParticipantsNumberSheetState extends State<ParticipantsNumberSheet> {
  int participants = 1;
  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: 400,
      child: Column(
        children: [
          Text(
            'Enter number of participants:',
            style: Styles.heading.copyWith(fontSize: 24),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 24,
          ),
          Scroller(
            items: 30,
            onNumberOfPersonChanged: (newParticipants) {
              participants = newParticipants + 1;
            },
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: CustomOvalButton(
              onPressed: () {
                Get.back();
                widget.onDone(participants);
              },
              color: Themes.primary,
              label: 'Subscription Form >',
            ),
          )
        ],
      ),
    );
  }
}
