import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/search_filter_option.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/tabs_body.dart';

class AllOrganizedGroupTripsBody extends StatelessWidget {
  const AllOrganizedGroupTripsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizedGroupCubit, OrganizedGroupCubitState>(
      builder: (context, state) {
        List<AllOrganizedGroupTrip>? allOrganizedGroupTrip =
            BlocProvider.of<OrganizedGroupCubit>(context).allOrganizedGroupTrip;
        return DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const OptionsSearchAndFilter(),
              TabBar(
                isScrollable: false,
                labelPadding: EdgeInsets.zero,
                labelColor: Colors.black,
                indicatorColor: Themes.primary,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Tab(text: 'All '),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Tab(text: 'Almost Complete'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Tab(text: 'Announced Trips'),
                  ),
                ],
                onTap: (index) {
                  final cubit = BlocProvider.of<OrganizedGroupCubit>(context);
                  switch (index) {
                    case 0:
                      cubit.getAllOrganizedTrips(tab: "All");
                      break;
                    case 1:
                      cubit.getAllOrganizedTrips(tab: "Almost Complete");
                      break;
                    case 2:
                      cubit.getAllOrganizedTrips(tab: "Almost Complete");
                      break;
                  }
                },
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TabsBody(allTrips: allOrganizedGroupTrip),
                    TabsBody(allTrips: allOrganizedGroupTrip),
                    TabsBody(allTrips: allOrganizedGroupTrip),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
