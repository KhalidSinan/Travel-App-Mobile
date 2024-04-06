import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
  });
  final VoidCallback onPressed;
  final String label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.transparent,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color ?? Themes.secondary,
        ),
      ),
    );
  }
}
