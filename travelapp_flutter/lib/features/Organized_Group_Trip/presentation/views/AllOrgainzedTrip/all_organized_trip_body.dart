import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/organized_by_advertisment.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/organized_group_non_advertisment.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/pagination_trips.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/search_filter_option.dart';

class AllOrganizedGroupTripsBody extends StatelessWidget {
  const AllOrganizedGroupTripsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<bool> data = [
      true,
      false,
      true,
      false,
      true,
      true,
      false,
      false
    ];
    final List<bool> dataC = [
      false,
      false,
      false,
      true,
      false,
      true,
      false,
      false
    ];

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
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildTabContent(data, allOrganizedGroupTrip),
                    _buildTabContent(data, allOrganizedGroupTrip),
                    _buildTabContent(data, allOrganizedGroupTrip),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabContent(List<bool> data, List<AllOrganizedGroupTrip> allTrips) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          MasonryGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: data.length,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            itemBuilder: (BuildContext context, int index) {
              return allTrips[index].isAnnounced
                  ? OrganizedByAdvertisment(oneTrip: allTrips[index],)
                  : OrganizedGroupNonAdvertisment(oneTrip: allTrips[index],);
            },
          ),
          const OrganizedTripPagination()
        ],
      ),
    );
  }
}




//  Container(
//                   color: data[index] ? Colors.green : Colors.blue,
//                   height: data[index] ? 240 : 190,
//                   child: Center(
//                     child: Text(
//                       data[index] ? 'True' : 'False',
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 );
