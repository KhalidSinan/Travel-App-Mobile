import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_participants_cubit/group_trip_participants_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_participants_cubit/group_trip_participants_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/participant_card.dart';

class GroupTripParticipantsPageBody extends StatelessWidget {
  const GroupTripParticipantsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: SafeArea(
        child: BlocConsumer<GroupTripParticipantsCubit,
            GroupTripParticipantsStates>(
          listener: (context, state) {
            if (state is FailureCancelReservationState) {
              showCustomSnackBar(
                  title: 'Cancel Failed',
                  message: state.failure.errMessage.toString());
            }
            if (state is SuccessCancelReservationState) {
              showCustomSnackBar(
                  title: 'Cancel Success',
                  message: 'Cancel Reservation Successfully');
            }
          },
          builder: (context, state) {
            if (state is LoadingParticipantsState ||
                state is LoadingCancelReservationState) {
              return const Center(
                child: CustomLoading(),
              );
            } else if (state is FailureParticipantsState) {
              return Center(
                child: Text(
                  state.failure.errMessage.toString(),
                  style: Styles.content,
                ),
              );
            } else if (state is NoParticipantsState) {
              return Center(
                child: Text(
                  'No Participants Yet',
                  style: Styles.content,
                ),
              );
            } else {
              final participants =
                  BlocProvider.of<GroupTripParticipantsCubit>(context)
                      .participants;
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  Text(
                    'Participants:',
                    style: Styles.heading,
                  ),
                  const SizedBox(height: 8),
                  ...List.generate(participants!.length, (index) {
                    return ParticipantCard(participant: participants[index]);
                  })
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
