import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

ButtonStyle getButtonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Themes.third;
      } else {
        return Themes.secondary!;
      }
    }),
  );
}
