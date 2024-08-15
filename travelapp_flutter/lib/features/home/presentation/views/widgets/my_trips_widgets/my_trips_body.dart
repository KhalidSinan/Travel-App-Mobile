import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_state.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/current_trips.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/latest_trips.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/switcher.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';

class MyTripsBody extends StatefulWidget {
  const MyTripsBody({super.key});
  @override
  State<MyTripsBody> createState() => _MyReservationsBodyState();
}

class _MyReservationsBodyState extends State<MyTripsBody> {
  bool? isOrganizer;

  @override
  void initState() {
    super.initState();
    isOrganizer = BlocProvider.of<ProfilePageCubit>(context).organizer;
    getSingleTrips();
    if (isOrganizer == true) {
      getOrganizerTrips();
    } else {
      getGroupTrips();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Switcher(),
        BlocBuilder<MyTripsCubit, MyTripsState>(
          builder: (context, state) {
            if (state is MyTripsSuccess) {
              if (BlocProvider.of<MyTripsCubit>(context).switcher == false) {
                return CurrentTrips(isOrganizer: isOrganizer!);
              } else {
                return LatestTrips(isOrganizer: isOrganizer!);
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Future<void> getSingleTrips() async {
    await BlocProvider.of<MyTripsCubit>(context).getMySingleTrips();
  }

  Future<void> getGroupTrips() async {
    await BlocProvider.of<MyTripsCubit>(context).getMyGroupTrips();
  }

  Future<void> getOrganizerTrips() async {
    await BlocProvider.of<MyTripsCubit>(context).getOrganizerTrips();
  }
}
