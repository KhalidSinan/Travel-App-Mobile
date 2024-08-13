import 'package:flutter/material.dart';
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
    return ListView.builder(
      itemCount: settingsItems.length,
      itemBuilder: (context, index) {
        if (settingsItems[index]["title"] == "Security") {
          return SecurityWidget(
            index: index,
          );
        } else if (settingsItems[index]["title"] == "General Setting") {
          return GeneralSettingWidget(index: index);
        } else {
          return OtherSettingWidget(index: index,);
        }
      },
    );
  }
}