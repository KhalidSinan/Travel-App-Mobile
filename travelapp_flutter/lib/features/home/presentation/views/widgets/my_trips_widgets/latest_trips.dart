import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/data/models/group_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/models/organizer_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/models/single_trips_model.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/all_cards_page.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/title_row.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/group_trips_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/single_trip_box.dart';

class LatestTrips extends StatefulWidget {
  const LatestTrips({super.key, required this.isOrganizer});
  final bool isOrganizer;

  @override
  State<LatestTrips> createState() => _LatestReservationsState();
}

class _LatestReservationsState extends State<LatestTrips> {
  List<SingleTripsModel> single = [];
  List<GroupTripsModel> group = [];
  List<OrganizerTripsModel> organizer = [];

  @override
  void initState() {
    super.initState();
    single = BlocProvider.of<MyTripsCubit>(context).latestSingle;
    group = BlocProvider.of<MyTripsCubit>(context).latestGroup;
    organizer = BlocProvider.of<MyTripsCubit>(context).currentOrganizer;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          title: 'Single trips',
          type: 'latest',
          onPressed: () {
            if (single.isNotEmpty) {
              Get.to(AllCardsPage(type: 'single', single: single));
            }
          },
        ),
        if (single.isNotEmpty) SingleTripBox(single: single[single.length - 1]),
        if (single.isEmpty)
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "No finished trips yet",
                style: TextStyle(color: Themes.third, fontSize: 15),
              ),
            ),
          ),
        TitleRow(
          title: 'Group trips',
          type: 'latest',
          onPressed: () {
            if (group.isNotEmpty) {
              Get.to(AllCardsPage(type: 'group', group: group));
            } else if (organizer.isNotEmpty) {
              Get.to(AllCardsPage(organizer: organizer));
            }
          },
        ),
        if (group.isNotEmpty)
          GroupTripBox(
            group: group[group.length - 1],
            isOrganizer: widget.isOrganizer,
          ),
        if (organizer.isNotEmpty)
          GroupTripBox(
            organizer: organizer[organizer.length - 1],
            isOrganizer: widget.isOrganizer,
          ),
        if (group.isEmpty && organizer.isEmpty)
          SizedBox(
            height: 225,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "No finished trips yet",
                style: TextStyle(color: Themes.third, fontSize: 15),
              ),
            ),
          ),
      ],
    );
  }
}
