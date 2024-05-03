import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/confirm_flight_reservation_page_body.dart';

class ConfirmFlightReservationPage extends StatelessWidget {
  const ConfirmFlightReservationPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ConfirmFlightReservationCubit(getIt.get<FlightBookingImp>())
            ..getFlightReservationData(idflight: "662f434518e13912586a8212"),
      child: const SafeArea(
        child: Scaffold(
          body: ConfirmFlightReservationPageBody(),
        ),
      ),
    );
  }
  }

