import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/flight_booking/data/repos/flight_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/confirm_flight_reservation_page_body.dart';

class ConfirmFlightReservationPage extends StatelessWidget {
   const ConfirmFlightReservationPage({
    super.key,
    required this.reservationId,  this.completed
  });
  final String reservationId;
  final bool? completed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmFlightReservationCubit(
        getIt.get<FlightBookingImp>(),
        reservationId: reservationId,
      )..getFlightReservationData(idflight: reservationId),
      child: SafeArea(
        child: Scaffold(
          body: BlocListener<ConfirmFlightReservationCubit,
              ConfirmFlightReservationState>(
            listener: (context, state) {
              if (state is FailureConfirmFlightReservationState) {
                Get.to(FailurePage(
                  error: state.failure,
                  onPressed: () async {
                    await BlocProvider.of<ConfirmFlightReservationCubit>(
                            context)
                        .getFlightReservationData(idflight: reservationId);
                  },
                ));
              }
            },
            child: ConfirmFlightReservationPageBody(completed: completed),
          ),
        ),
      ),
    );
  }
}
