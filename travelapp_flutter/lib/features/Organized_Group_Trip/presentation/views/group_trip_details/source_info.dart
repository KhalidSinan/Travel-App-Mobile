import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_oval_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/announcements/presentation/views/announcements_subscriptions_page.dart';

class SourceInfo extends StatelessWidget {
  const SourceInfo({
    super.key,
    required this.source,
  });

  final String source;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            source,
            style: Styles.heading,
            overflow: TextOverflow.clip,
          ),
        ),
        Offstage(
          offstage:
              !BlocProvider.of<GroupTripDetailsCubit>(context).isOrganizer,
          child: CustomOvalButton(
            color: Themes.third,
            onPressed: () {
              Get.to(() => AnnouncementsSubscriptionsPage(
                    tripId:
                        BlocProvider.of<GroupTripDetailsCubit>(context).tripId,
                  ));
            },
            label: 'Announce',
          ),
        ),
      ],
    );
  }
}
