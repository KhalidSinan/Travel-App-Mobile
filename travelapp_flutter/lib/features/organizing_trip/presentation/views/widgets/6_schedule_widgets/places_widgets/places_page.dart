import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/places_widgets/places_page_body.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({
    super.key,
    required this.city,
    required this.step,
    required this.schedule,
  });
  final String city;
  final int step;
  final ScheduleCubit schedule;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: schedule,
      child: DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: Text('Select activities in $city'),
            titleTextStyle:
                Styles.heading2.copyWith(color: Themes.third, fontSize: 25),
          ),
          body: SafeArea(
            child: BlocListener<ScheduleCubit, ScheduleStates>(
              listener: (context, state) {
                if (state is GetPlacesFailure) {
                  Get.to(
                    () => FailurePage(
                      error: state.failure,
                      onPressed: () {},
                    ),
                  );
                }
              },
              child: PlacesPageBody(
                city: city,
                step: step,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
