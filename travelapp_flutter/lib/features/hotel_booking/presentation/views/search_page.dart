import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_page_widgets/search_page_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: const Icon(
              FontAwesomeIcons.chevronLeft,
              size: 20,
              color: Colors.white,
            ),
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    'assets/images/hotel_search.jpg',
                    fit: BoxFit.fill,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 260),
                    height: 14,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SearchPageBody(),
          ),
        ],
      ),
    );
  }
}
