import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_hotel_page_widgets/custom_popular_places.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SearchCitys extends StatelessWidget {
  SearchCitys({super.key});
  List<String> citys = [
    'Amesterdam',
    'Dubai',
    'Berlin',
    'Istanbul',
    'London',
    'Paris',
    'Tokyo',
  ];
  List<String> images = [
    'assets/images/amesterdam.png',
    'assets/images/dubai.jpg',
    'assets/images/berlin.jpg',
    'assets/images/istanbul.jpg',
    'assets/images/london.jpg',
    'assets/images/paris.jpg',
    'assets/images/tokyo.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'Most popular citys',
            style: GoogleFonts.quattrocento().copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Themes.third,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  if (index == 0) const SizedBox(width: 24),
                  PopularCitys(
                    image: images[index],
                    city: citys[index],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
