import 'package:flutter/material.dart';

import '../../../../../core/helpers/custom_ticket_shape.dart';
import '../../../../../core/helpers/dashed_line_painter.dart';
import '../../../../../core/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class OneWayTicket extends StatelessWidget {
  const OneWayTicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomTicketShape(),
      child: Card(
        // height: 250,
        // padding: const EdgeInsets.all(16),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(15),
        //   color: Themes.primary,
        // ),
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    // backgroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    radius: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Airline Name',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // from to
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Syria',
                        style: GoogleFonts.quattrocento().copyWith(
                          // color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '2024-5-12',
                        style: Styles.subtitle.copyWith(
                          // color: Colors.white54,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '2hr 30min',
                          style: Styles.subtitle.copyWith(
                            // color: Colors.white54,
                            color: Colors.black54,
                          ),
                        ),
                        const Divider(
                          color: Colors.black38,
                          indent: 10,
                          endIndent: 10,
                          thickness: 2,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Japan',
                        style: GoogleFonts.quattrocento().copyWith(
                          // color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '2024-5-13',
                        style: Styles.subtitle.copyWith(
                          // color: Colors.white54,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              CustomPaint(
                painter: DashedLinePainter(),
                child: Container(),
              ),
              // time
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '6:00PM',
                    style: TextStyle(
                      // color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '900\$',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}