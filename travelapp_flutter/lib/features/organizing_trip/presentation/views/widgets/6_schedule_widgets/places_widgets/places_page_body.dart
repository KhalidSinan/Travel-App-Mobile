import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/places_widgets/places_list.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/places_widgets/places_tab_bar.dart';

class PlacesPageBody extends StatelessWidget {
  const PlacesPageBody({super.key, required this.city, required this.step});
  final String city;
  final int step;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PlacesTabBar(),
        Expanded(
          child: TabBarView(
            children: [
              PlacesList(category: 'Food', city: city , step: step,),
              PlacesList(category: 'Attraction', city: city,step: step,),
              PlacesList(category: 'Cinema', city: city , step: step,),
              PlacesList(category: 'Adventure', city: city , step: step,),
              // PlacesList(category: 'Arts & History', city: city , step: step,),
              PlacesList(category: 'Mall', city: city , step: step,),
              PlacesList(category: 'Sports', city: city , step:step ,),
              PlacesList(category: 'Market', city: city , step: step,),
              PlacesList(category: 'Park', city: city , step: step,),
              PlacesList(category: 'Street', city: city, step: step,),
            ],
          ),
        ),
      ],
    );
  }
}
