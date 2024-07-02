import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

// ignore: must_be_immutable
class CustomTag extends StatelessWidget {
  CustomTag({
    super.key,
    required this.text,
    this.icon,
    this.roomTag,
  });

  final String text;
  final IconData? icon;
  bool? roomTag;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: roomTag == true
                ? Themes.primary.withOpacity(0.2)
                : Colors.white,
          ),
          child: Icon(
            icon,
            size: 30,
            color: roomTag == true ? Colors.grey[600] : Themes.third,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: roomTag == true ? Colors.grey[600] : Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
