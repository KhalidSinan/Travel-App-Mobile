import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/places_widgets/places_page_body.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({super.key, required this.city, required this.step});
  final String city;
  final int step;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizingTripCubit(getIt.get<OrganizingTripImpl>()),
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
            child: BlocListener<OrganizingTripCubit, OrganizingTripStates>(
              listener: (context, state) {
                if (state is FailureOrganizingTrip) {
                  Get.to(
                    () => FailurePage(
                      error: state.failure,
                      onPressed: () {},
                    ),
                  );
                }
              },
              child: PlacesPageBody(city: city , step: step,),
            ),
          ),
        ),
      ),
    );
  }
}
