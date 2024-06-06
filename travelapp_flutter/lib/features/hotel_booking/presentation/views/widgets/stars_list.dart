import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/hotel_model.dart';

class starsList extends StatelessWidget {
  const starsList({
    super.key,
    required this.stars,
  });

  final int stars;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (intx) => Icon(
          intx < stars ? Icons.star : Icons.star_border,
          color: intx < stars ? Themes.third : Colors.grey,
        ),
      ),
    );
  }
}
