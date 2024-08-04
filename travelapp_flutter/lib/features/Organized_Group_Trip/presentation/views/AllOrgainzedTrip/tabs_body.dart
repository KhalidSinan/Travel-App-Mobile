import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/organized_by_advertisment.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/organized_group_non_advertisment.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/pagination_trips.dart';

class TabsBody extends StatefulWidget {
  final String tab;

  const TabsBody({super.key, required this.tab});

  static const List<bool> data = [
    true,
    false,
    true,
    false,
    true,
    true,
    false,
    false,
    true,
    false
  ];

  @override
  State<TabsBody> createState() => _TabsBodyState();
}

class _TabsBodyState extends State<TabsBody> {
  @override
  void initState() {
    super.initState();
    // Fetch trips for the initial tab
    BlocProvider.of<OrganizedGroupCubit>(context)
        .getAllOrganizedTrips(tab: widget.tab);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizedGroupCubit, OrganizedGroupCubitState>(
      builder: (context, state) {
        if (state is LoadingOrganizedGroupTripState) {
          return _buildShimmerLoading();
        }

        if (state is SuccessOrganizedGroupTripState) {
          List<AllOrganizedGroupTrip> allTrips =
              BlocProvider.of<OrganizedGroupCubit>(context)
                  .allOrganizedGroupTrip;
          return _buildTripsList(allTrips);
        }

        return const SizedBox();
      },
    );
  }

  Widget _buildShimmerLoading() {
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
            itemCount: 10,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            itemBuilder: (BuildContext context, int index) {
              return TabsBody.data[index]
                  ? _buildShimmerBox()
                  : _buildShimmerBox(
                      height: MediaQuery.of(context).size.height * 0.4);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerBox({double height = 200}) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 216, 216),
          border: Border.all(
            color: Colors.grey,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildTripsList(List<AllOrganizedGroupTrip> allTrips) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SizedBox(
            child: MasonryGridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: allTrips.length,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              itemBuilder: (BuildContext context, int index) {
                return allTrips[index].isAnnounced
                    ? OrganizedByAdvertisment(oneTrip: allTrips[index])
                    : OrganizedGroupNonAdvertisment(oneTrip: allTrips[index]);
              },
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          OrganizedTripPagination(),
        ],
      ),
    );
  }
}
