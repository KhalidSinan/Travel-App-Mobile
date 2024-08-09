import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_destination_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_footer.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_info_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/group_trip_details/group_trip_pricing_page.dart';

class OrganizedGroupTripDetailsPageBody extends StatefulWidget {
  const OrganizedGroupTripDetailsPageBody({super.key});
  @override
  State<OrganizedGroupTripDetailsPageBody> createState() =>
      _OrganizedGroupTripDetailsPageBodyState();
}

class _OrganizedGroupTripDetailsPageBodyState
    extends State<OrganizedGroupTripDetailsPageBody> {
  late String currentDestination;
  late PageController controller;
  String source = 'Saudi Arabia';
  List<String> destinations = ['United States', 'Egypt', 'Syria'];
  bool isBack = false;
  @override
  void initState() {
    super.initState();
    currentDestination = destinations[0];
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GroupTripInfoPage(destinations: [source, ...destinations]),
              ...List.generate(
                destinations.length,
                (index) {
                  return GroupTripDestinationPage(index: index);
                },
              ),
              const GroupTripPricingPage(),
            ],
          ),
        ),
        GroupTripFooter(
          currentDestination: currentDestination,
          isBack: isBack,
          controller: controller,
        ),
      ],
    );
  }

  void onPageChanged(index) {
    if (index == destinations.length) {
      setState(() {
        currentDestination = 'Pricing';
      });
      return;
    }
    if (index == destinations.length + 1) {
      setState(() {
        currentDestination = 'Pay';
      });
      return;
    }
    setState(() {
      isBack = index >= 1;
      currentDestination = destinations[index];
    });
  }
}
