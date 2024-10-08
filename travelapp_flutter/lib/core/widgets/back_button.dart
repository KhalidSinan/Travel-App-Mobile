import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.color,
    this.onBack,
  });
  final Color? color;
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBack ?? () => Get.back(),
      icon: Icon(
        FontAwesomeIcons.chevronLeft,
        size: 20,
        color: color ?? Themes.primary,
      ),
    );
  }
}
