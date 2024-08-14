import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/data/models/notifi_model.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile(
      {super.key, required this.tittle, this.listOfNotifiModel});
  final String tittle;
  final List<NotifiModel>? listOfNotifiModel;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isexpand = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ExpansionTile(
        title: Row(
          children: [
            const Icon(
              Icons.notifications,
              color: Colors.orange,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.tittle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        trailing: Icon(
          isexpand ? FontAwesomeIcons.chevronUp : FontAwesomeIcons.chevronDown,
          color: Themes.primary,
          size: 16,
        ),
        backgroundColor: Themes.secondary,
        onExpansionChanged: (value) {
          setState(() {
            isexpand = value;
          });
        },
        expansionAnimationStyle: AnimationStyle(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        collapsedBackgroundColor: Colors.grey[300],
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        children: buildChildWidgets(),
      ),
    );
  }

  List<Widget> buildChildWidgets() {
    return (widget.listOfNotifiModel == null ||
            widget.listOfNotifiModel!.isEmpty)
        ? [
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 16),
              child: Center(
                child: Text(
                  'No Notifications yet ... ',
                  style: TextStyle(
                      color: Themes.primary, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]
        : widget.listOfNotifiModel!.map((notifi) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  notifi.notificationTitle,
                  style: TextStyle(
                      color: Themes.primary, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notifi.notificationBody),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    notifi.createdAt,
                    style: TextStyle(
                        color: Themes.third,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                isThreeLine: true,
              ),
            );
          }).toList();
  }
}
