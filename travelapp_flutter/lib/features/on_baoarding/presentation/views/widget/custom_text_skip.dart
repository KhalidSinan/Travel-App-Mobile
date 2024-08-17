import 'package:flutter/material.dart';

class CustomTextSkip extends StatelessWidget {
  const CustomTextSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
          "Skip",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}