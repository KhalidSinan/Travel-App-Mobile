import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/appbar_details_card.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/confirmation_step_buttons.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/details_header.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/passengers_list.dart';

class ConfirmFlightReservationPageBody extends StatelessWidget {
  const ConfirmFlightReservationPageBody(
      {super.key,this.completed});

  final bool? completed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomScrollView(
          slivers: [
            AppBarDetailsCard(),
            SliverToBoxAdapter(
              child: DetailsHeader(),
            ),
            PassengersList(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            )
          ],
        ),
        if (completed != true)
          const ConfirmationStepButtons(),
      ],
    );
  }
}
