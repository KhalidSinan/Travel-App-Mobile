import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomContainerNext extends StatelessWidget {
  const CustomContainerNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Themes.primary,
        ),
        child: const Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.white,
          size: 30,
        ));
  }
}
