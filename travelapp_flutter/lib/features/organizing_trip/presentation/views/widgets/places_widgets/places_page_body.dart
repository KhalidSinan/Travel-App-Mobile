import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/places_widgets/places_list.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/places_widgets/places_tab_bar.dart';

class PlacesPageBody extends StatelessWidget {
  const PlacesPageBody({super.key, required this.city});
  final String city;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PlacesTabBar(),
        Expanded(
          child: TabBarView(
            children: [
              PlacesList(category: 'Food', city: city),
              PlacesList(category: 'Cinema', city: city),
              PlacesList(category: 'Mall', city: city),
              PlacesList(category: 'Market', city: city),
              PlacesList(category: 'Arts & History', city: city),
              PlacesList(category: 'Attraction', city: city),
              PlacesList(category: 'Street', city: city),
              PlacesList(category: 'Park', city: city),
              PlacesList(category: 'Adventure', city: city),
              PlacesList(category: 'Sports', city: city),
            ],
          ),
        ),
      ],
    );
  }
}
