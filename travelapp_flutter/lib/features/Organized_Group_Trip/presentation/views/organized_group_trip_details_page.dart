import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/organized_group_trip_details_page_body.dart';

class OrganizedGroupTripDetailsPage extends StatelessWidget {
  const OrganizedGroupTripDetailsPage({
    super.key,
    required this.tripId,
  });
  final String tripId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupTripDetailsCubit(
        getIt.get<OrganizingGroupTripImpl>(),
        tripId: tripId,
      )..getGroupTripDetails(),
      child: const Scaffold(
        body: SafeArea(
          child: OrganizedGroupTripDetailsPageBody(),
        ),
      ),
    );
  }
}
