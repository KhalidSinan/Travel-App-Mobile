import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

Future<DateTime?> customDatePicker({required BuildContext context}) async {
  return await showDatePicker(
      builder: (context, widget) {
        return Theme(data: Themes.datePickerTheme, child: widget!);
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100));
}
