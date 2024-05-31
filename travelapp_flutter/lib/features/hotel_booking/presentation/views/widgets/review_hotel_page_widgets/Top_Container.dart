import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class TopContainerHotel extends StatelessWidget {
  const TopContainerHotel(
      {super.key, required this.heightbackground, required this.bottom});

  final double heightbackground;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Themes.primary,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
      ),
      margin: EdgeInsets.only(bottom: bottom),
      height: heightbackground,
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              BackButton(
                color: Colors.white,
                onPressed: () => Get.back(),
              ),
              const SizedBox(
                width: 70,
              ),
              const Text(
                'The Review',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
