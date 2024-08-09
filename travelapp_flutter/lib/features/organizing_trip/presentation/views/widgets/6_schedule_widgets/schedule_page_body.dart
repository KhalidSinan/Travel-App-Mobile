import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/schedule_tab_view.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/schedule_tabs.dart';

class SchedulePageBody extends StatelessWidget {
  const SchedulePageBody({
    super.key,
    required this.tabController,
    required this.onScheduleDone,
  });

  final TabController tabController;
  final Function(dynamic schedule, dynamic places) onScheduleDone;

  @override
  Widget build(BuildContext context) {
    final schedule = BlocProvider.of<ScheduleCubit>(context);
    return SafeArea(
      child: DefaultTabController(
        length: schedule.destinations.length,
        initialIndex: 0,
        child: Column(
          children: [
            ScheduleTabs(
              tabController: tabController,
              cities: schedule.destinations,
            ),
            const SizedBox(
              height: 15,
            ),
            ScheduleTabbarView(
              tabController: tabController,
              cities: schedule.destinations,
              onScheduleDone: onScheduleDone,
              currentSteps:
                  BlocProvider.of<ScheduleCubit>(context).currentSteps,
            ),
          ],
        ),
      ),
    );
  }
}
