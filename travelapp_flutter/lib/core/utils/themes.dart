import 'package:flutter/material.dart';

class Themes {
  static Color primary = const Color(0xff205E61);
  static Color? secondary = Colors.grey[100];
  static Color third = const Color(0xffffb156);
  static ThemeData timePickerTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: Themes.primary,
      onSurface: Themes.third,
    ),
    // button colors
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: Themes.third,
      ),
    ),
  );
  static ThemeData datePickerTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: Themes.primary,
      onSurface: Themes.primary,
    ),
    // button colors
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: Themes.primary,
      ),
    ),
  );
}



// primary colors:
// 1- 084c61
// 2- 1D5D9B
// 3- 205E61