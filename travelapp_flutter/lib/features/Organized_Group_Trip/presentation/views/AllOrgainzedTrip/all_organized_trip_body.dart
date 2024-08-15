import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/search_filter_option.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/tabs_body.dart';

class AllOrganizedGroupTripsBody extends StatelessWidget {
  const AllOrganizedGroupTripsBody({super.key, required this.controller});
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizedGroupCubit, OrganizedGroupCubitState>(
      builder: (context, state) {
        //dynamic cubit = BlocProvider.of<OrganizedGroupCubit>(context);
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
                onTap: (index) async {
                  final cubit = BlocProvider.of<OrganizedGroupCubit>(context);
                  switch (index) {
                    case 0:
                      cubit.changeTab("All");
                      await cubit.getAllOrganizedTrips(
                          tab: "All",
                          page: cubit.page,
                          source: cubit.source,
                          startDate: cubit.startDate,
                          endDate: cubit.endDate,
                          startPrice: cubit.minPrice,
                          endPrice: cubit.maxPrice,
                          types: cubit.selectedTypes,
                          countries: cubit.selectedCountries);
                      break;
                    case 1:
                      cubit.changeTab("AlmostComplete");
                      await cubit.getAllOrganizedTrips(
                          tab: "AlmostComplete",
                          page: cubit.page,
                          source: cubit.source,
                          startDate: cubit.startDate,
                          endDate: cubit.endDate,
                          startPrice: cubit.minPrice,
                          endPrice: cubit.maxPrice,
                          types: cubit.selectedTypes,
                          countries: cubit.selectedCountries);
                      break;
                    case 2:
                      cubit.changeTab("AnnouncedTrips");
                      await cubit.getAllOrganizedTrips(
                          tab: "AnnouncedTrips",
                          page: cubit.page,
                          source: cubit.source,
                          startDate: cubit.startDate,
                          endDate: cubit.endDate,
                          startPrice: cubit.minPrice,
                          endPrice: cubit.maxPrice,
                          types: cubit.selectedTypes,
                          countries: cubit.selectedCountries);
                      break;
                  }
                },
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    TabsBody(tab: 'All', controller: controller),
                    TabsBody(tab: 'AlmostComplete', controller: controller),
                    TabsBody(tab: 'AnnouncedTrips', controller: controller),
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
