import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.size,
  });
  final VoidCallback onPressed;
  final String label;
  final Color? color;
  final double? size;
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
          color: color ?? Colors.grey,
          fontSize: size,
        ),
      ),
    );
  }
}
