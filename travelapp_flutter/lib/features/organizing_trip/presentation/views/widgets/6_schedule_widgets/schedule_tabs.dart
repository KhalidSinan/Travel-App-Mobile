import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class ScheduleTabs extends StatelessWidget {
  const ScheduleTabs({
    super.key,
    required this.tabController,
    required this.cities,
  });

  final TabController tabController;
  final List cities;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(height: 50),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TabBar(
          dividerColor: Colors.white,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          labelStyle:
              TextStyle(color: Themes.third, fontWeight: FontWeight.bold),
          indicator: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Themes.primary),
          tabs: cities.map((city) => Tab(text: city['city'])).toList(),
        ),
      ),
    );
  }
}
