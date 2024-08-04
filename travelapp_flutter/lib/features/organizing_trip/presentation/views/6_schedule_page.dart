import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_Schedule_widgets/schedule_tabs.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/schedule_tab_view.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrganizingTripCubit>(context).createTripSchedule();
    BlocProvider.of<OrganizingTripCubit>(context).createCurrentSteps();
  }

  @override
  Widget build(BuildContext context) {
    List<int> currentSteps =
        BlocProvider.of<OrganizingTripCubit>(context).currentSteps;

    List<DestinationsModel> cities =
        BlocProvider.of<OrganizingTripCubit>(context).destinations;

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
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 20,
              color: Themes.primary,
            ),
          ),
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
