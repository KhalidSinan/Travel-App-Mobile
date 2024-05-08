import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/appbar_details_card.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/confirmation_step_buttons.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/details_header.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/passengers_list.dart';

class ConfirmFlightReservationPageBody extends StatefulWidget {
  const ConfirmFlightReservationPageBody({
    super.key,
  });

  @override
  State<ConfirmFlightReservationPageBody> createState() =>
      _ConfirmFlightReservationPageBodyState();
}

class _ConfirmFlightReservationPageBodyState
    extends State<ConfirmFlightReservationPageBody> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomScrollView(
          slivers: [
            AppBarDetailsCard(),
<<<<<<< HEAD
<<<<<<< Updated upstream
            DetailsHeader(),
=======
            DetsailsHeader(),
>>>>>>> Stashed changes
=======
            SliverToBoxAdapter(
              child: DetailsHeader(),
            ),
>>>>>>> 8347de67f3f82d9510092df9382981cc1c16f338
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
