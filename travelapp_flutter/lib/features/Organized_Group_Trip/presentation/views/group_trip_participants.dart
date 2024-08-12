import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/trip_destination_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_participants_cubit/group_trip_participants_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_participants_page_body.dart';

class GroupTripParticipantsPage extends StatelessWidget {
  const GroupTripParticipantsPage({
    super.key,
    required this.tripId,
    required this.isOrganizer,
  });
  final String tripId;
  final bool isOrganizer;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupTripParticipantsCubit(
        getIt.get<OrganizingGroupTripImpl>(),
        tripId: tripId,
        isOrganizer: isOrganizer,
      )..getTripParticipants(),
      child: Scaffold(
        appBar: AppBar(leading: const CustomBackButton()),
        body: const GroupTripParticipantsPageBody(),
      ),
    );
  }
}
