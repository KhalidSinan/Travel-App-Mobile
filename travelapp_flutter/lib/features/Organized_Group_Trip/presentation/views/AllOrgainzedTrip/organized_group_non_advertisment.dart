import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class OrganizedGroupNonAdvertisment extends StatelessWidget {
  const OrganizedGroupNonAdvertisment({super.key, required this.bol});
  final bool bol;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final containerHeight = bol ? 360.0 : 356.0;
        final padding =
            screenWidth * 0.02;
        final isLargeScreen = screenWidth > 600;

        return Stack(
          children: [
            Container(
              width: screenWidth * 0.9, 
              height: containerHeight,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216),
                border:
                    Border.all(color: bol ? Colors.red : Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: bol ? padding : padding / 2,
                  ),
                  Text(
                    "Organizer Tima Dawaa",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: isLargeScreen ? 18 : 16,
                    ),
                  ),
                  SizedBox(height: padding),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.planeDeparture,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      SizedBox(
                        width: padding,
                      ),
                      Text(
                        'Syria',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isLargeScreen ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: padding,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.planeArrival,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      SizedBox(
                        width: padding,
                      ),
                      Flexible(
                        child: Text(
                          'Korea - Paris',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLargeScreen ? 18 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: padding,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Types: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLargeScreen ? 18 : 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Entertainment, Exploration, Educational',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLargeScreen ? 18 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: padding),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.person,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      Text(
                        ' : 10/15',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isLargeScreen ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: padding),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      Text(
                        '24/9/2024',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isLargeScreen ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: padding,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.dollarSign,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      Text('300\$',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLargeScreen ? 18 : 16,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: padding,
                  ),
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
