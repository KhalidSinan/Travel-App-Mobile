import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomTextSkip extends StatelessWidget {
  const CustomTextSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Skip",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Themes.primary,
        ));
  }
}
