import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSheet extends StatelessWidget {
  const CustomSheet({
    super.key,
    required this.height,
    required this.child,
  });
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: child,
    );
  }
}
