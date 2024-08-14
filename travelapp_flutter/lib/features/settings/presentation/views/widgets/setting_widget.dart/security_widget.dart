import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/change_password_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/setting_Items.dart';

class SecurityWidget extends StatefulWidget {
  const SecurityWidget({super.key, required this.index});
  final int index;

  @override
  State<SecurityWidget> createState() => _SecurityWidgetState();
}

class _SecurityWidgetState extends State<SecurityWidget> {
  bool isSecurityExpanded = false;
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
            isSecurityExpanded
                ? FontAwesomeIcons.chevronUp
                : FontAwesomeIcons.chevronDown,
            color: Themes.primary,
            size: 20,
          ),
          onTap: () {
            setState(() {
              isSecurityExpanded = !isSecurityExpanded;
            });
          },
        ),
        if (isSecurityExpanded)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: const Icon(
                    Icons.password,
                    color: Color.fromARGB(255, 202, 113, 107),
                  ),
                  title: const Text('Change Password'),
                  onTap: () {
                    Get.to(() => const ChangePasswordPage());
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15),
              //   child: ListTile(
              //     leading: const Icon(Icons.fingerprint),
              //     title: const Text('Fingerprint'),
              //     onTap: () {},
              //   ),
              // ),
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
