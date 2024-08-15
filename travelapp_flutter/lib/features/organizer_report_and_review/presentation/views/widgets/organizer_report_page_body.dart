import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_report_cubit/organizer_report_cubit.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_report_cubit/organizer_report_states.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/organizer_report_page.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/widgets/organizer_card..dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/widgets/organizer_report_sheet.dart';

class OrganizerReportPageBody extends StatelessWidget {
  const OrganizerReportPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: BlocBuilder<OrganizerReportCubit, OrganizerReportStates>(
        builder: (context, state) {
          final organizers =
              BlocProvider.of<OrganizerReportCubit>(context).organizers;
          return ListView(
            children: [
              Text(
                'Organizers You\'ve Participate with :',
                style: Styles.heading.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 16),
              ...List.generate(organizers.length, (index) {
                return OrganizerCard(organizer: organizers[index]);
              })
            ],
          );
        },
      ),
    );
  }
}
