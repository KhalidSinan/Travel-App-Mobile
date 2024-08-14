import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_cubit.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_step_circular.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/destinations_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/schedule_page_body.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({
    super.key,
    required this.destinations,
    this.isEditable = true,
    this.isShowDetails = false,
    this.initialDestination = 0,
    required this.onScheduleDone,
    this.tripId,
    this.onScheduleBack,
  });
  final List<DestinationsModel> destinations;
  final int initialDestination;
  final bool isEditable;
  final bool isShowDetails;
  final String? tripId;
  final Function(dynamic schedule, dynamic places) onScheduleDone;
  final VoidCallback? onScheduleBack;
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: widget.destinations.length,
      vsync: this,
      initialIndex: widget.initialDestination,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ScheduleCubit(
          destinations: widget.destinations,
          isEditable: widget.isEditable,
          isShowDetails: widget.isShowDetails,
          organizingTripImpl: getIt.get<OrganizingTripImpl>(),
        )
          ..createCurrentSteps()
          ..createTripSchedule()
          ..getTripSchedule(tripId: widget.tripId);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Your Flight Schedule',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Themes.primary),
            ),
            actions: [
              (!widget.isShowDetails)
                  ? const Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomStepCircular(
                        progress: 0.75,
                        text: '6/8',
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(width: 15)
            ],
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            leading: IconButton(
              onPressed: widget.onScheduleBack ??
                  () {
                    Get.back();
                  },
              icon: Icon(
                FontAwesomeIcons.chevronLeft,
                size: 20,
                color: Themes.primary,
              ),
            ),
          ),
          body: SchedulePageBody(
            tabController: tabController,
            onScheduleDone: widget.onScheduleDone,
          )),
    );
  }
}
