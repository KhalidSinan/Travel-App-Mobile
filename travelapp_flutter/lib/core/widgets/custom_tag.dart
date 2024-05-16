import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({super.key, required this.text, this.icon});

  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Icon(
            icon,
            color: Themes.third,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
