import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class UserData extends StatelessWidget {
  const UserData(
      {super.key, required this.icon, required this.text, this.edit});
  final IconData icon;
  final String text;
  final bool? edit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, top: 25, right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 32,
                    color: Themes.primary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              if (edit == true)
                Text(
                  'Edit',
                  style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: Themes.primary),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Divider(
          color: Themes.third,
          thickness: 2,
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }
}
