import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class OrganizedByAdvertisment extends StatelessWidget {
  const OrganizedByAdvertisment({
    super.key,
    required this.bol,
  });

  final bool bol;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final isLargeScreen = width > 600;

        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216),
                border: Border.all(
                  color: bol ? Colors.red : Themes.third,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: bol ? 17 : 8),
                  const Text(
                    "Organizer Tima Dawaa",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.planeDeparture,
                        color: Themes.primary,
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Syria',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.planeArrival,
                        color: Themes.primary,
                      ),
                      const SizedBox(width: 16),
                      const Flexible(
                        child: Text(
                          'Korea - Paris - China',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Types: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Entertainment, Exploration, Educational',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.person,
                        color: Themes.primary,
                      ),
                      const Text(
                        ' : 10/15',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        color: Themes.primary,
                      ),
                      const Text(
                        '24/9/2024',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.dollarSign,
                        color: Themes.primary,
                      ),
                      const Text(
                        '300\$',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                ],
              ),
            ),
            if (bol)
              Positioned(
                top: -10,
                right: -10,
                child: Container(
                  width: isLargeScreen ? 50 : 40,
                  height: isLargeScreen ? 50 : 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: Lottie.asset('assets/animations/time.json'),
                ),
              ),
          ],
        );
      },
    );
  }
}
