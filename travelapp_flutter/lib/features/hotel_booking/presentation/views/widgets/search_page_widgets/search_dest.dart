import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchDest extends StatelessWidget {
  const SearchDest(
      {super.key,
      required this.destination,
      required this.date,
      required this.duration});
  final String destination;
  final String date;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You already have a trip to',
            style: GoogleFonts.quattrocento().copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Themes.third,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Card(
              shadowColor: Themes.primary,
              color: Colors.white,
              elevation: 0.5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 10),
                        Text(
                          destination,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.calendarDay,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 10),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.view_day_outlined,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 10),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
