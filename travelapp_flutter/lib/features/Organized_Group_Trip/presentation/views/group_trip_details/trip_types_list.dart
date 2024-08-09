import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class TripTypesList extends StatelessWidget {
  const TripTypesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    const tripTypes = [
      "Artistic",
      "Educational",
      "Entertainment",
      "Therapeutic",
      "Exploratory"
    ];
    return Wrap(
      children: List.generate(tripTypes.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Chip(
            backgroundColor: Themes.primary.withOpacity(0.8),
            side: BorderSide.none,
            labelStyle: Styles.content.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            label: Text(tripTypes[index]),
          ),
        );
      }),
    );
  }
}
