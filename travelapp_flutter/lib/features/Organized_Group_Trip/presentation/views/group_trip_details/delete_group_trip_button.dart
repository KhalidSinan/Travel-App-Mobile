import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';

class DeleteGroupTripButton extends StatelessWidget {
  const DeleteGroupTripButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isOrganizer =
        BlocProvider.of<GroupTripDetailsCubit>(context).isOrganizer;
    return Offstage(
      offstage: !isOrganizer,
      child: IconButton(
          onPressed: () {
            final groupTrip = BlocProvider.of<GroupTripDetailsCubit>(context);
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: groupTrip,
                  child: AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text(
                      "Delete Group Trip",
                    ),
                    content: Text(
                      "Delete this group trip will causing you to lose ${groupTrip.groupTrip!.priceWithCommission}. Are you sure you want to delete it?",
                    ),
                    actions: [
                      CustomTextButton(
                        onPressed: () => Get.back(),
                        label: 'Back',
                      ),
                      CustomTextButton(
                        onPressed: () async {
                          Get.back();
                          await groupTrip.deleteGroupTrip();
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
            FontAwesomeIcons.trash,
            color: Colors.red,
          )),
    );
  }
}
