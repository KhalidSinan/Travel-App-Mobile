import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

Future<TimeOfDay?> showCustomTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
}) async {
  return await showTimePicker(
    context: context,
    initialTime: initialTime,
    initialEntryMode: TimePickerEntryMode.dial,
    builder: (context, child) {
      return Theme(
        data: Themes.timePickerTheme,
        child: child!,
      );
    },
  );
}
