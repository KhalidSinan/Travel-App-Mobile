import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/dash_line_divider.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/destinations_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/source_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_date_info.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/trip_types_list.dart';

class GroupTripInfoPage extends StatelessWidget {
  const GroupTripInfoPage({
    super.key,
    required this.destinations,
  });

  final List<String> destinations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          Text(
            'Organized By Khalid Sinan',
            style: Styles.content.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: DashLineDivider(),
          ),
          SourceInfo(source: destinations[0]),
          const SizedBox(height: 8),
          DestinationsInfo(destinations: destinations),
          const SizedBox(height: 16),
          const TripDateInfo(
            startDate: '20/08/2024',
            endDate: '13/09/2024',
            days: '30',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: DashLineDivider(),
          ),
          const TripTypesList(),
          const Spacer(),
        ],
      ),
    );
  }
}
