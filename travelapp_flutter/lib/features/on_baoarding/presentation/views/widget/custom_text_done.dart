import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomtTextdone extends StatelessWidget {
  const CustomtTextdone({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Done",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Themes.primary,
        ));
  }
}
