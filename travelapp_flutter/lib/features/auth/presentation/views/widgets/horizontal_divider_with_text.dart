import 'package:flutter/material.dart';

class HorizontalDividerWithText extends StatelessWidget {
  const HorizontalDividerWithText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 10,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        const Expanded(
          child: Divider(
            indent: 10,
          ),
        ),
      ],
    );
  }
}
