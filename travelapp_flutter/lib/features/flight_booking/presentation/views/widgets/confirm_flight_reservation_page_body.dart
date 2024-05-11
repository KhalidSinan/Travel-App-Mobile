import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';
=======
>>>>>>> Khalid
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/appbar_details_card.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/confirmation_step_buttons.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/details_header.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/passengers_list.dart';

<<<<<<< HEAD
class ConfirmFlightReservationPageBody extends StatefulWidget {
=======
class ConfirmFlightReservationPageBody extends StatelessWidget {
>>>>>>> Khalid
  const ConfirmFlightReservationPageBody({
    super.key,
  });

<<<<<<< HEAD
  @override
  State<ConfirmFlightReservationPageBody> createState() =>
      _ConfirmFlightReservationPageBodyState();
}

class _ConfirmFlightReservationPageBodyState
    extends State<ConfirmFlightReservationPageBody> {
=======
>>>>>>> Khalid
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CustomScrollView(
          slivers: [
            AppBarDetailsCard(),
<<<<<<< HEAD
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
=======
            SliverToBoxAdapter(
              child: DetailsHeader(),
            ),
>>>>>>> Khalid
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
