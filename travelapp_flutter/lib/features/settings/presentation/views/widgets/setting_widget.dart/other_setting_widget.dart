import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/setting_Items.dart';

class OtherSettingWidget extends StatelessWidget {
  const OtherSettingWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            leading: Icon(settingsItems[index]["icon"],
                color: settingsItems[index]["color"]),
            title: Text(
              settingsItems[index]["title"],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
              color: Themes.primary,
              size: 20,
            ),
            onTap: () {
              settingsItems[index]["onTap"](context);
            }),
        const Padding(
          padding: EdgeInsets.only(left: 60.0, right: 24),
          child: Divider(),
        ),
      ],
    );
  }
}
