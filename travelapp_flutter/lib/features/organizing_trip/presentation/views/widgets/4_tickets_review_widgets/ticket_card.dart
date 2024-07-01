import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/flight_details_page.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.state});
  final String state;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: state == '' ? 100 : 200,
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: state == 'yes'
              ? Themes.primary
              : state == 'no'
                  ? Themes.third
                  : Colors.black54,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Istanbul',
            style: GoogleFonts.quattrocento().copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          if (state == 'yes')
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Turkish airlines',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.moneyCheckDollar,
                        color: Themes.third,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '\$1000',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Themes.third,
                        size: 23,
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        '3:00 PM',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.5),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          FlightDetailsPage(
                            id: '66602840f9cdbc928352e6fa',
                            classType: 'A',
                            seats: 3,
                            visible: false,
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Details',
                            style:
                                TextStyle(fontSize: 16, color: Themes.primary),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Themes.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (state == 'no')
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.filter,
                        color: Themes.third,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Filtered by :',
                        style: TextStyle(fontSize: 15, color: Themes.third),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Turkish airlines',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$500 _ \$1000',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '5:00 pm  _ 9:00 pm',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          if (state == '')
            const Text(
              'There is no available airports',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
        ],
      ),
    );
  }
}
