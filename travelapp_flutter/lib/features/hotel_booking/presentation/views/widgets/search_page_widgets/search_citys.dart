import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_page_widgets/custom_popular_places.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchCitys extends StatelessWidget {
  const SearchCitys({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'Most popular places',
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  if (index == 0) const SizedBox(width: 24),
                  const PopularCitys(
                    image: 'assets/images/dubai.jpg',
                    city: 'Dubai',
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
