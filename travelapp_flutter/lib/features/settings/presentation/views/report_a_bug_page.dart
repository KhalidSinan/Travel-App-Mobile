import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/report_and_rating_widgets/report_a_bug_page_body.dart';

class ReportABugPage extends StatelessWidget {
  const ReportABugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report',
          style:
              TextStyle(color: Themes.primary, fontWeight: FontWeight.bold),
        ),
        leading: const CustomBackButton(),
      ),
      body: const ReportABugPageBody(),
    );
  }
}
