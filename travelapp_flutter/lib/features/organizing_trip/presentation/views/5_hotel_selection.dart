import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection/hotel_selection_body.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/custom_step_circular.dart';

class HotelSelection extends StatelessWidget {
  const HotelSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(8),
              child: CustomStepCircular(
                progress: 0.625,
                text: '5/8',
              ),
            ),
            SizedBox(width: 15)
          ],
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: const CustomBackButton(),
        ),
        body: const HotelSelectionBody());
  }
}