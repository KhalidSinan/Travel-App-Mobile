import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_participants_cubit/group_trip_participants_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_participants.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/passenger_model.dart';

class ParticipantCard extends StatelessWidget {
  const ParticipantCard({
    super.key,
    required this.participant,
  });
  final PassengerModel participant;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Themes.secondary,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(-6, 0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  participant.personName,
                  style: Styles.content,
                ),
                const SizedBox(height: 8),
                Text(
                  participant.passport!,
                  style: Styles.subtitle,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          IconButton(
              onPressed: () {
                final participants =
                    BlocProvider.of<GroupTripParticipantsCubit>(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    return BlocProvider.value(
                      value: participants,
                      child: AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text(
                          "Cancel Reservation",
                        ),
                        content: Text(
                            "Are you sure you want to cancel reservation for ${participant.personName}?"),
                        actions: [
                          CustomTextButton(
                              onPressed: () => Get.back(), label: 'Back'),
                          CustomTextButton(
                            onPressed: () async {
                              await participants.cancelGroupTripReservation(
                                  participantId: participant.id!);
                              Get.back();
                            },
                            label: 'Yes',
                            color: Themes.primary,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                FontAwesomeIcons.remove,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
