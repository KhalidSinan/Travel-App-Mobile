import 'package:flutter/material.dart';
//import 'package:travelapp_flutter/core/utils/themes.dart';

class ScrollItem extends StatelessWidget {
  const ScrollItem({super.key, required this.num});
  final int num;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        num.toString(),
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}
