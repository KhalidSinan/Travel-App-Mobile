import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            Assets.flight,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.33,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
