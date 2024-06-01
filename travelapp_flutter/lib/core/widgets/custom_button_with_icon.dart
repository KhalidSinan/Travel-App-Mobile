import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    required this.suffix, this.colorText,
  });
  //Tima
  final String label;
  final Widget suffix;
  final VoidCallback onPressed;
  final Color? color;
  final Color? colorText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          suffix,
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: colorText?? Themes.primary,
            ),
          ),
        ],
      ),
    );
  }
}
