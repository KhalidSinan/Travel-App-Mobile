import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/repos/organizing_trip_repo_impl.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/organizing_trip_page_body.dart';

class OrganizingTripPage extends StatefulWidget {
  const OrganizingTripPage({
    super.key,
    this.groupTrip = true,
  });
  final bool groupTrip;

  @override
  State<OrganizingTripPage> createState() => _OrganizingTripPageState();
}

class _OrganizingTripPageState extends State<OrganizingTripPage> {
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizingTripCubit(
        OrganizingTripImpl(getIt.get<ApiService>()),
      )..getCountriesAndAirlines(),
      child: BlocListener<OrganizingTripCubit, OrganizingTripStates>(
        listener: (context, state) {
          if (state is NextPageState) {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          } else if (state is PreviousPageState) {
            controller.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          }
        },
        child: OrganizingTripPageBody(
          controller: controller,
          groupTrip: widget.groupTrip,
        ),
      ),
    );
  }
}
