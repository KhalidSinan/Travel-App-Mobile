import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/schedule_view_content.dart';

class ScheduleTabbarView extends StatefulWidget {
  const ScheduleTabbarView({
    super.key,
    required this.tabController,
    required this.cities,
    required this.currentSteps,
    required this.onScheduleDone,
  });

  final TabController tabController;
  final List<DestinationsModel> cities;
  final List<int> currentSteps;
  final Function(dynamic schedule, dynamic places) onScheduleDone;

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
      widget.onScheduleDone(
        BlocProvider.of<ScheduleCubit>(context).tripSchedule,
        BlocProvider.of<ScheduleCubit>(context).places,
      );
    }
  }
}
