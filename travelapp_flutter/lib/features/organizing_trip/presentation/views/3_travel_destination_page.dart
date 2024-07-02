import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/travel_destination_page_body.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/custom_step_circular.dart';

class TravelDestinationPage extends StatelessWidget {
  const TravelDestinationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: const [
            // Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: Text(
            //     'Step 3/8',
            //     style: TextStyle(color: Themes.primary, fontSize: 22),
            //   ),
            // ),
            CustomStepCircular(progress: 0.375),
            SizedBox(width: 15)
          ],
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: const CustomBackButton(),
        ),
        body: const TravelDestinationPageBody(),
      ),
    );
  }
}
