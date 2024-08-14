import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_subscribe_cubit/group_trip_subscribe_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_subscribe_cubit/group_trip_subscribe_states.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';

class GroupTripSubscribePage extends StatelessWidget {
  const GroupTripSubscribePage({
    super.key,
    required this.tripId,
    required this.participantsNum,
    required this.participants,
  });
  final String tripId;
  final int participantsNum;
  final List<PassengerModel> participants;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupTripSubscribeCubit(
        getIt.get<OrganizingGroupTripImpl>(),
      )..subscribe(
          tripId: tripId,
          numOfParticipants: participantsNum,
          participants: participants,
        ),
      child: Scaffold(
        body: SafeArea(
          child:
              BlocConsumer<GroupTripSubscribeCubit, GroupTripSubscribeStates>(
                  listener: (context, state) {
            if (state is SuccessSubscribeState) {
              Get.back();
              Get.back();
              showCustomSnackBar(
                title: 'Subscribe Success',
                message: 'You have successfully subscribed',
              );
            }
          }, builder: (context, state) {
            if (state is LoadingSubscribeState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FailureSubscribeState) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.failure.errMessage.toString(),
                      style: Styles.content,
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onPressed: () {
                          Get.back();
                          Get.back();
                        },
                        color: Themes.secondary,
                        colorText: Themes.primary,
                        label: 'Back',
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                  child: Lottie.asset('assets/animations/check.json'));
            }
          }),
        ),
      ),
    );
  }
}
