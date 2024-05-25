import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/all_hotel_options.dart';

class AllHotelsHeader extends StatelessWidget {
  const AllHotelsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'All Hotels',
                style: Styles.heading,
              ),
              const SizedBox(width: 8),
              const Text(
                '(5)',
                style: Styles.subtitle,
              ),
            ],
          ),
          const AllHotelsOptions()
        ],
      ),
    );
  }
}