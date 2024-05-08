import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/one_view_bar.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/two_view_bar.dart';

class TabbarView extends StatelessWidget {
  const TabbarView({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TabBarView(
      controller: tabController,
      children: const [OneViewBar(), TwoViewBar()],
    ));
  }
}
