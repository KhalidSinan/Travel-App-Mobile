import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/data/models/group_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/models/organizer_trips_model.dart';
import 'package:travelapp_flutter/features/home/data/models/single_trips_model.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/title_row.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/group_trips_box.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/single_trip_box.dart';

class CurrentTrips extends StatefulWidget {
  const CurrentTrips({super.key, required this.isOrganizer});
  final bool isOrganizer;

  @override
  State<CurrentTrips> createState() => _CurrentReservationsState();
}

class _CurrentReservationsState extends State<CurrentTrips> {
  List<SingleTripsModel> single = [];
  List<GroupTripsModel> group = [];
  List<OrganizerTripsModel> organizer = [];

  @override
  void initState() {
    super.initState();
    single = BlocProvider.of<MyTripsCubit>(context).currentSingle;
    group = BlocProvider.of<MyTripsCubit>(context).currentGroup;
    organizer = BlocProvider.of<MyTripsCubit>(context).currentOrganizer;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TitleRow(title: 'Single trips', type: 'current'),
            SizedBox(
              height: single.isNotEmpty ? single.length * 200 : 200,
              child: single.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: single.length,
                      itemBuilder: (context, index) {
                        return SingleTripBox(single: single[index]);
                      },
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'No current trip reservations',
                          style: TextStyle(color: Themes.third, fontSize: 15),
                        ),
                      ),
                    ),
            ),
            const TitleRow(title: 'Group trips', type: 'current'),
            SizedBox(
              height: group.isNotEmpty
                  ? group.length * 230
                  : organizer.isNotEmpty
                      ? organizer.length * 230
                      : 200,
              child: group.isNotEmpty || organizer.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          group.isNotEmpty ? group.length : organizer.length,
                      itemBuilder: (context, index) {
                        return GroupTripBox(
                          group:
                              widget.isOrganizer == false ? group[index] : null,
                          organizer: widget.isOrganizer == true
                              ? organizer[index]
                              : null,
                          isOrganizer: widget.isOrganizer,
                        );
                      },
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'No current trip reservations',
                          style: TextStyle(color: Themes.third, fontSize: 15),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
