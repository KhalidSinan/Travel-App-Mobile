import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_Schedule_widgets/schedule_tabs.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/schedule_tab_view.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>> cities = [
    {'city': 'Paris', 'days': 4},
    {'city': 'Roma', 'days': 2},
    {'city': 'Oman', 'days': 4},
    {'city': 'Damascus', 'days': 4},
  ];

  List<int> currentSteps = [];

  @override
  void initState() {
    super.initState();
    currentSteps = List.filled(cities.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: cities.length, vsync: this);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Flight Schedule',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Themes.primary),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8),
              child: CustomStepCircular(
                progress: 0.75,
                text: '6/8',
              ),
            ),
            SizedBox(width: 15)
          ],
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: const CustomBackButton(),
        ),
        body: SafeArea(
          child: DefaultTabController(
            length: cities.length,
            initialIndex: 0,
            child: Column(
              children: [
                ScheduleTabs(
                  tabController: tabController,
                  cities: cities,
                ),
                const SizedBox(
                  height: 15,
                ),
                ScheduleTabbarView(
                  tabController: tabController,
                  cities: cities,
                  currentSteps: currentSteps,
                ),
              ],
            ),
          ),
        ));
  }
}
