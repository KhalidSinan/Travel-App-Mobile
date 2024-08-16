import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/data/repos/organizer_report_repo_impl.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_review_cubit/organizer_review_cubit.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/widgets/organizer_review_page_body.dart';

class OrganizerReviewPage extends StatelessWidget {
  const OrganizerReviewPage({
    super.key,
    required this.tripId,
    required this.organizerName,
  });
  final String tripId;
  final String organizerName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizerReviewCubit(
        OrganizerReportRepoImpl(getIt.get<ApiService>()),
        tripId,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                FontAwesomeIcons.remove,
                color: Colors.black38,
              )),
        ),
        body: OrganizerReviewPageBody(organizerName: organizerName),
      ),
    );
  }
}
