import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CountryInfo extends StatelessWidget {
  const CountryInfo({
    super.key,
    required this.country,
    required this.date,
  });

  final String country;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          country,
          style: GoogleFonts.quattrocento().copyWith(
            color: Themes.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          date,
          style: Styles.subtitle.copyWith(
            // color: Colors.white54,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
