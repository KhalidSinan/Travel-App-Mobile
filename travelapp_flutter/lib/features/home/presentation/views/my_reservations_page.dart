import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_cubit.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_state.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/my_reservations_body.dart';

class MyReservationsPage extends StatelessWidget {
  const MyReservationsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text('My reservations', style: Styles.heading2),
      ),
      body: SafeArea(
        child: BlocListener<MyReservationsCubit, MyReservationsState>(
          child: const MyReservationsBody(),
          listener: (context, state) {
            if (state is MyReservationsFailure) {
              Get.to(
                () => FailurePage(
                  error: state.failure,
                  onPressed: () {},
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
