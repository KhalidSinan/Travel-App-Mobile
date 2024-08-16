import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/core/widgets/custom_oval_button.dart';
import 'package:travelapp_flutter/core/widgets/nav_bar_pages.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/data/repos/organizer_report_repo_impl.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_report_cubit/organizer_report_cubit.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/view_model/organizer_report_cubit/organizer_report_states.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/widgets/organizer_report_page_body.dart';

class OrganizerReportPage extends StatelessWidget {
  const OrganizerReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          OrganizerReportCubit(OrganizerReportRepoImpl(getIt.get<ApiService>()))
            ..getOrganizersForReport(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: BlocBuilder<OrganizerReportCubit, OrganizerReportStates>(
            builder: (context, state) {
          if (state is LoadingGetOrganizersState) {
            return const Center(
              child: CustomLoading(),
            );
          } else if (state is FailureGetOrganizersState) {
            return Center(
              child: Text(
                state.failure.errMessage,
                style: Styles.content,
              ),
            );
          } else if (state is NoOrganizersState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'There\'s no organizers you participate with',
                  style: Styles.content,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                CustomOvalButton(
                  onPressed: () {
                   Get.off(() => NavBarPages(initIndex: 1,));
                  },
                  color: Themes.primary,
                  label: 'Participate with one',
                ),
              ],
            );
          } else {
            return const OrganizerReportPageBody();
          }
        }),
      ),
    );
  }
}
