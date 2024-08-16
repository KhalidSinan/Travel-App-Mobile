import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/presentation/views/organizer_report_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/report_a_bug_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/setting_Items.dart';

class ReportSettingWidget extends StatefulWidget {
  const ReportSettingWidget({super.key, required this.index});
  final int index;

  @override
  State<ReportSettingWidget> createState() => _ReportSettingWidgetState();
}

class _ReportSettingWidgetState extends State<ReportSettingWidget> {
  bool isReportExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(settingsItems[widget.index]["icon"],
              color: settingsItems[widget.index]["color"]),
          title: Text(
            settingsItems[widget.index]["title"],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            isReportExpanded
                ? FontAwesomeIcons.chevronUp
                : FontAwesomeIcons.chevronDown,
            color: Themes.primary,
            size: 20,
          ),
          onTap: () {
            setState(() {
              isReportExpanded = !isReportExpanded;
            });
          },
        ),
        if (isReportExpanded)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: const Icon(
                    Icons.report_gmailerrorred,
                    color: Color.fromARGB(255, 81, 137, 164),
                  ),
                  title: const Text(
                    'Report A Bug',
                  ),
                  onTap: () {
                    Get.to(() => const ReportABugPage());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.bugs,
                    color: Color.fromARGB(255, 81, 137, 164),
                  ),
                  title: const Text('Report on organizers'),
                  onTap: () {
                    Get.to(() => const OrganizerReportPage());
                  },
                ),
              ),
              const SizedBox(height: 2),
            ],
          ),
        const Padding(
          padding: EdgeInsets.only(left: 60.0, right: 24),
          child: Divider(),
        ),
      ],
    );
  }
}
