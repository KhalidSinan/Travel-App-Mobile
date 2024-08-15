import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/settings/data/models/all_notifi_model.dart';
import 'package:travelapp_flutter/features/settings/data/models/notifi_model.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/notifi_page_widgets/custom_expansion_tile.dart';

class NotifiPagebody extends StatelessWidget {
  const NotifiPagebody({
    super.key,
    required this.days,
    required this.allNotifications, required this.controller,
  });

  final List<String> days;
  final AllNotifiModel? allNotifications;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
          child: Row(
            children: [
              Text(
                'Notifications',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Themes.primary,
                    fontSize: 24),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              controller: controller,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  List<NotifiModel>? notificationsList;
                  switch (index) {
                    case 0:
                      notificationsList = allNotifications?.today;
                      break;
                    case 1:
                      notificationsList = allNotifications?.yesterday;
                      break;
                    case 2:
                      notificationsList = allNotifications?.week;
                      break;
                    case 3:
                      notificationsList = allNotifications?.month;
                      break;
                    case 4:
                      notificationsList = allNotifications?.year;
                      break;
                    case 5:
                      notificationsList = allNotifications?.moreThanYear;
                      break;
                    default:
                      notificationsList = [];
                  }
                  return CustomExpansionTile(
                    tittle: days[index],
                    listOfNotifiModel: notificationsList,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
