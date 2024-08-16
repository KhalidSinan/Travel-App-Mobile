import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/profile_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/setting_page_body.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.controller,
  });
  final ScrollController controller;
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: Styles.heading2),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundColor: Themes.secondary,
                child: Icon(Icons.person, size: 24, color: Themes.primary),
              ),
            ),
            onPressed: () {
              Get.to(() => const ProfilePage());
            },
          ),
        ],
      ),
      body: SafeArea(child: SettingPageBody(controller: widget.controller)),
    );
  }
}
