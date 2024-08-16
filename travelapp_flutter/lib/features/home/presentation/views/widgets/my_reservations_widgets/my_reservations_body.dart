import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_state.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/current_reservations_body.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/latest_reservations_body.dart.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/switcher.dart';

class MyReservationsBody extends StatefulWidget {
  const MyReservationsBody({super.key});
  @override
  State<MyReservationsBody> createState() => _MyReservationsBodyState();
}

class _MyReservationsBodyState extends State<MyReservationsBody> {
  @override
  void initState() {
    super.initState();
    getReservations();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Switcher(),
        BlocBuilder<MyReservationsCubit, MyReservationsState>(
          builder: (context, state) {
            if (state is MyReservationsSuccess) {
              if (BlocProvider.of<MyReservationsCubit>(context).switcher ==
                  false) {
                return const CurrentReservations();
              } else {
                return const LatestReservations();
              }
            } else {
              return const CustomLoading();
            }
          },
        ),
      ],
    );
  }

  Future<void> getReservations() async {
    await BlocProvider.of<MyReservationsCubit>(context).getReservations();
  }
}
