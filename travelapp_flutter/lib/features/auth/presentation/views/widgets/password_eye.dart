import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class PasswordEye extends StatefulWidget {
  const PasswordEye({
    super.key,
    required this.onToggle,
  });

  final VoidCallback onToggle;

  @override
  State<PasswordEye> createState() => _PasswordEyeState();
}

class _PasswordEyeState extends State<PasswordEye> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          open = !open;
        });
        widget.onToggle();
      },
      icon: Icon(
        open ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
        size: 20,
        color: open ? Themes.primary : Colors.grey,
      ),
    );
  }
}
