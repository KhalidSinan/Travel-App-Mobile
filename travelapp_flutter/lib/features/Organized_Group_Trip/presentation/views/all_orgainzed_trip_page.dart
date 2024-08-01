import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/all_organized_trip_body.dart';

class AllOrganizedGroupTrips extends StatelessWidget {
  const AllOrganizedGroupTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: const Padding(
          padding: EdgeInsets.all(0.8),
          child: AllOrganizedGroupTripsBody(),
        ),
      ),
    );
  }
}
