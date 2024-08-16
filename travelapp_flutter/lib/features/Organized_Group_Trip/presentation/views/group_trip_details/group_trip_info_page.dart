import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/dash_line_divider.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/delete_group_trip_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/destinations_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/source_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_date_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_types_list.dart';

class GroupTripInfoPage extends StatelessWidget {
  const GroupTripInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final groupTrip = BlocProvider.of<GroupTripDetailsCubit>(context).groupTrip;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                DeleteGroupTripButton(),
              ],
            ),
            Text(
              'Organized By ${groupTrip!.organizer}',
              style: Styles.content.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: DashLineDivider(),
            ),
            SourceInfo(source: groupTrip.source.city),
            const SizedBox(height: 8),
            DestinationsInfo(destinations: groupTrip.destinations),
            const SizedBox(height: 16),
            TripDateInfo(
              startDate: groupTrip.startDate,
              endDate: groupTrip.endDate,
              days: groupTrip.days.toString(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: DashLineDivider(),
            ),
            const TripTypesList(),
            const SizedBox(height: 16),
            Text(
              'Description',
              style: Styles.heading2.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              groupTrip.description,
              style: Styles.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
