import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/data/models/organizer_model.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_report_cubit/organizer_report_cubit.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/widgets/organizer_report_sheet.dart';

class OrganizerCard extends StatelessWidget {
  const OrganizerCard({
    super.key,
    required this.organizer,
  });

  final OrganizerModel organizer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Themes.secondary,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: NetworkImage(organizer.picture),
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              organizer.name,
              style: Styles.content.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              final report = BlocProvider.of<OrganizerReportCubit>(context);
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return BlocProvider.value(
                    value: report,
                    child: OrganzierReportSheet(organizer: organizer),
                  );
                },
              );
            },
            icon: const Icon(
              FontAwesomeIcons.ban,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
