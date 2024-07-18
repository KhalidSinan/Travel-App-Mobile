import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class StarsListReview extends StatelessWidget {
  const StarsListReview({
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
