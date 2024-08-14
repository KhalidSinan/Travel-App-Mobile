import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_trips_cubit/my_trips_state.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_trips_widgets/my_trips_body.dart';

class MyTripsPage extends StatelessWidget {
  const MyTripsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text('My trips', style: Styles.heading2),
      ),
      body: SafeArea(
        child: BlocListener<MyTripsCubit, MyTripsState>(
          child: const MyTripsBody(),
          listener: (context, state) {
            if (state is MyTripsFailure) {
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
