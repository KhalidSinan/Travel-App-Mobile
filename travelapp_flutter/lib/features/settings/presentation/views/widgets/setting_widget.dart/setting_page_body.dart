import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/profile_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/general_setting_widget.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/other_setting_widget.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/security_widget.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/setting_Items.dart';

class SettingPageBody extends StatelessWidget {
  const SettingPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Settings',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Themes.primary,
                    fontSize: 24),
              ),
            ),
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
        Expanded(
          child: ListView.builder(
            itemCount: settingsItems.length,
            itemBuilder: (context, index) {
              if (settingsItems[index]["title"] == "Security") {
                return SecurityWidget(
                  index: index,
                );
              } else if (settingsItems[index]["title"] == "General Setting") {
                return GeneralSettingWidget(index: index);
              } else {
                return OtherSettingWidget(
                  index: index,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
