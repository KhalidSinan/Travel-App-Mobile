import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class AirlineInfo extends StatelessWidget {
  const AirlineInfo({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          // backgroundColor: Colors.white,
          backgroundColor: Colors.black,
          radius: 20,
        ),
        const SizedBox(width: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
