import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/settings/data/models/all_notifi_model.dart';
import 'package:travelapp_flutter/features/settings/data/models/notifi_model.dart';
import 'package:travelapp_flutter/features/settings/presentation/views/widgets/notifi_page_widgets/custom_expansion_tile.dart';

class NotifiPagebody extends StatelessWidget {
  const NotifiPagebody({
    super.key,
    required this.days,
    required this.allNotifications,
  });

  final List<String> days;
  final AllNotifiModel? allNotifications;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
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
    );
  }
}
