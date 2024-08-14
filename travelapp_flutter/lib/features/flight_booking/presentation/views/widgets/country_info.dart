import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CountryInfo extends StatelessWidget {
  const CountryInfo({
    super.key,
    required this.source,
    required this.destination,
  });

  final String source;
  final String destination;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            source,
            style: GoogleFonts.quattrocento().copyWith(
              color: Themes.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Text(
            destination,
            style: GoogleFonts.quattrocento().copyWith(
              color: Themes.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
