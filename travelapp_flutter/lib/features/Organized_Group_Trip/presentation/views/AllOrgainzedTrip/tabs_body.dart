import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/organized_by_advertisment.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/organized_group_non_advertisment.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/pagination_trips.dart';

class TabsBody extends StatelessWidget {
  const TabsBody({super.key,required this.allTrips});


final List<AllOrganizedGroupTrip> allTrips;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          MasonryGridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: allTrips.length,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            itemBuilder: (BuildContext context, int index) {
              return allTrips[index].isAnnounced
                  ? OrganizedByAdvertisment(
                      oneTrip: allTrips[index],
                    )
                  : OrganizedGroupNonAdvertisment(
                      oneTrip: allTrips[index],
                    );
            },
          ),
          const OrganizedTripPagination()
        ],
      ),
    ); ;
  }
}



