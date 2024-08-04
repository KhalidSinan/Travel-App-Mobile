import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/all_organized_trip_body.dart';

class AllOrganizedGroupTrips extends StatefulWidget {
  const AllOrganizedGroupTrips({super.key});

  @override
  _AllOrganizedGroupTripsState createState() => _AllOrganizedGroupTripsState();
}

class _AllOrganizedGroupTripsState extends State<AllOrganizedGroupTrips> {
  @override
  void initState() {
    super.initState();
    final organizedGroupCubit = BlocProvider.of<OrganizedGroupCubit>(context);
    organizedGroupCubit.getAllCountries();
    organizedGroupCubit.getAllOrganizedTrips();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: BlocListener<OrganizedGroupCubit, OrganizedGroupCubitState>(
          listener: (context, state) {
            if (state is FailureOrganizedGroupTripState) {
              print(state.failure.errMessage);
              Get.to(() => FailurePage(
                error: state.failure,
                onPressed: () async {
                  await BlocProvider.of<OrganizedGroupCubit>(context).getAllOrganizedTrips();
                },
              ));
            }
          },
          child: const Padding(
            padding: EdgeInsets.all(0.8),
            child: AllOrganizedGroupTripsBody(),
          ),
        ),
      ),
    );
  }
}
