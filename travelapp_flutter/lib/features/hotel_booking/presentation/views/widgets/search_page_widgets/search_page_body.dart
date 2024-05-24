import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_page_widgets/search_citys.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_page_widgets/search_dest.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_page_widgets/search_fields.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: const Column(
        children: [
          SearchFields(),
          SearchDest(
              destination: 'Amman, Jordan',
              date: '30/5/2024',
              duration: 'For 5 days'),
          SearchCitys(),
        ],
      ),
    );
  }
}
