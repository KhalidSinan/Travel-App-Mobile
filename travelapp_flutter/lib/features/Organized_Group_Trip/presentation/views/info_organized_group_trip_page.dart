import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/info_organized_group_trip_page_widgets/info_organized_trip_page_body.dart';


class InfoOrganizedGroupTripPage extends StatelessWidget {
  const InfoOrganizedGroupTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: const SafeArea(child: InfoOrganizedGroupTripPageBody()),
    );
  }
}

