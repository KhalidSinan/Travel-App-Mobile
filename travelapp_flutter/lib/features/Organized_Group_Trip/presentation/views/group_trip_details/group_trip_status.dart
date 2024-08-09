import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/helpers/trip_status.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class GroupTripStatus extends StatelessWidget {
  const GroupTripStatus({
    super.key,
    required this.status,
  });
  final TripStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Lottie.asset(
          status.animation,
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 8),
        Text(
          status.value,
          style: Styles.content.copyWith(
            color: Themes.primary,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
