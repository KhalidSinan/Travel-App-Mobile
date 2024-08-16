import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/organized_group_trip_details_page_body.dart';

class OrganizedGroupTripDetailsPage extends StatelessWidget {
  const OrganizedGroupTripDetailsPage({
    super.key,
    required this.tripId,
    this.subscribed = false,
    this.isOrganizer = false,
  });
  final String tripId;
  final bool subscribed;
  final bool isOrganizer;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => GroupTripDetailsCubit(
          getIt.get<OrganizingGroupTripImpl>(),
          tripId: tripId,
          subscribed: subscribed,
          isOrganizer: isOrganizer)
        ..getGroupTripDetails(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<GroupTripDetailsCubit, GroupTripDetailsState>(
              listener: (context, state) {
            if (state is DeleteGroupTripSuccessState) {
              Get.back();
              showCustomSnackBar(
                title: 'Delete Success',
                message: 'Group trip have been deleted successfully',
              );
            }
          }, builder: (context, state) {
            if (state is GroupTripDetailsLoadingState) {
              return const Center(
                child: CustomLoading(),
              );
            } else if (state is GroupTripDetailsFailureState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.failure.errMessage.toString(),
                      style: Styles.content,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      onPressed: () {
                        Get.back();
                      },
                      color: Themes.secondary,
                      colorText: Themes.primary,
                      label: 'Back',
                    )
                  ],
                ),
              );
            } else {
              return const OrganizedGroupTripDetailsPageBody();
            }
          }),
        ),
      ),
    );
  }
}
