import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/appbar_details_card.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/confirmation_step_buttons.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/details_header.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/passengers_list.dart';

class ConfirmFlightReservationPageBody extends StatelessWidget {
  const ConfirmFlightReservationPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomScrollView(
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
        ConfirmationStepButtons(),
      ],
    );
  }
}
