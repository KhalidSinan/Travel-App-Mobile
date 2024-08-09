import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class DestinationsInfo extends StatelessWidget {
  const DestinationsInfo({
    super.key,
    required this.destinations,
  });

  final List<String> destinations;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              destinations.length - 1,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        size: 16,
                        color: Themes.third,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          destinations[index + 1],
                          style: Styles.content.copyWith(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
