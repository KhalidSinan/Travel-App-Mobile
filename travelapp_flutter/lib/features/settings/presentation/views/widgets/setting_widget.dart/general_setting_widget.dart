import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/setting_widget.dart/setting_Items.dart';

class GeneralSettingWidget extends StatefulWidget {
  const GeneralSettingWidget({super.key, required this.index});
  final int index;

  @override
  State<GeneralSettingWidget> createState() => _GeneralSettingWidgetState();
}

class _GeneralSettingWidgetState extends State<GeneralSettingWidget> {
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
                  leading: const Icon(Icons.colorize),
                  title: const Text(
                    'Themes',
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.language,
                    color: Color.fromARGB(255, 142, 214, 144),
                  ),
                  title: const Text('Loclazation'),
                  onTap: () {},
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
