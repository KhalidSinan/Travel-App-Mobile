import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class Styles {
  static final heading = GoogleFonts.quattrocento().copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Themes.primary,
  );
  static const subtitle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );
  static final heading2 = GoogleFonts.quattrocento().copyWith(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Themes.primary,
  );
  static final content = TextStyle(
    color: Themes.third,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
