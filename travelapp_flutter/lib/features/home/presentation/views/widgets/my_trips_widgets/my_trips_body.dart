import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_state.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/current_trips.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/latest_trips.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/switcher.dart';

class MyTripsBody extends StatefulWidget {
  const MyTripsBody({super.key});
  @override
  State<MyTripsBody> createState() => _MyReservationsBodyState();
}

class _MyReservationsBodyState extends State<MyTripsBody> {
  @override
  void initState() {
    super.initState();
    getTrips();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Switcher(),
        BlocBuilder<MyTripsCubit, MyTripsState>(
          builder: (context, state) {
            if (state is MyTripsSuccess) {
              if (BlocProvider.of<MyTripsCubit>(context).switcher ==
                  false) {
                return const CurrentTrips();
              } else {
                return const LatestTrips();
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }

  Future<void> getTrips() async {
    await BlocProvider.of<MyTripsCubit>(context).getTrips();
  }
}
