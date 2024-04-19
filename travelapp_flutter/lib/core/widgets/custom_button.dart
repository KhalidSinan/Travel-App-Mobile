import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
  });
  final VoidCallback? onPressed;
  final String label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Themes.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
