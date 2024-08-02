import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/all_organized_trip_body.dart';

class AllOrganizedGroupTrips extends StatelessWidget {
  const AllOrganizedGroupTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrganizedGroupCubit(getIt.get<OrganizingGroupTripImpl>())
            ..getAllCountries(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
          ),
          body: BlocListener<OrganizedGroupCubit, OrganizedGroupCubitState>(
            listener: (context, state) {
              if(state is FailureOrganizedGroupTripState){
                Get.to(FailurePage(error: state.failure, onPressed:()async{
                  await BlocProvider.of<OrganizedGroupCubit>(context).getAllOrganizedTrips();
                } ));
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(0.8),
              child: AllOrganizedGroupTripsBody(),
            ),
          ),
        ),
      ),
    );
  }
}
