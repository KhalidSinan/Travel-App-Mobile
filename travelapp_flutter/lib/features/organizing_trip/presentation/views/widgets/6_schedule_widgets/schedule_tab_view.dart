import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';

import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/schedule_view_content.dart';

class ScheduleTabbarView extends StatefulWidget {
  const ScheduleTabbarView({
    super.key,
    required this.tabController,
    required this.cities,
    required this.currentSteps,
  });

  final TabController tabController;
  final List<DestinationsModel> cities;
  final List<int> currentSteps; 

  @override
  State<ScheduleTabbarView> createState() => _ScheduleTabbarViewState();
}

class _ScheduleTabbarViewState extends State<ScheduleTabbarView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(
      controller: widget.tabController,
      children: widget.cities
          .asMap()
          .map((index, city) => MapEntry(
              index,
              ScheduleViewContent(
                index: index,
                city: city,
                cities: widget.cities,
                currentSteps: widget.currentSteps,
                tabController: widget.tabController,
                navigateToNextCity: navigateToNextCity,
              )))
          .values
          .toList(),
    ));
  }

  void navigateToNextCity() {
    int currentIndex = widget.tabController.index;
    if (currentIndex < widget.cities.length - 1) {
      widget.tabController.animateTo(currentIndex + 1);
    } else {

          // go to page's of tima
    }
  }
}
