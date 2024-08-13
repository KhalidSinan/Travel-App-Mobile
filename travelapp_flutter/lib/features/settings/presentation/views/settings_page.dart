import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/setting_page_body.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text('Settings',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Themes.primary)),
        ),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundColor: Themes.secondary,
                child: Icon(Icons.person, size: 24, color: Themes.primary),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const SettingPageBody(),
    );
  }
}
