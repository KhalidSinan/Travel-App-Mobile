import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/form_page.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmFlightReservationCubit,
        ConfirmFlightReservationState>(
      builder: (context, state) {
        ReservationModel? reservation =
            BlocProvider.of<ConfirmFlightReservationCubit>(context).reservation;
        return Visibility(
          visible: state is! LoadingConfirmFlightReservationState &&
              reservation != null,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (reservation == null) return;
                    Get.to(() => FormPage(
                          reservationId:
                              BlocProvider.of<ConfirmFlightReservationCubit>(
                                      context)
                                  .reservationId,
                          passengers: reservation.flight.reservations!,
                          classType:
                              reservation.flight.reservations![0].seatClass,
                          seats: reservation.seat!,
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Themes.secondary,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.airline_seat_recline_extra,
                              size: 32,
                              color: Themes.primary,
                              applyTextScaling: true,
                            ),
                            Text(
                              (reservation == null &&
                                      state
                                          is LoadingConfirmFlightReservationState)
                                  ? ''
                                  : ": ${reservation!.seat}",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Themes.primary,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          FontAwesomeIcons.chevronRight,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  (reservation == null &&
                          state is LoadingConfirmFlightReservationState)
                      ? ''
                      : reservation!.flight.reservations![0].seatClass,
                  style: TextStyle(
                      fontSize: 18,
                      color: Themes.primary,
                      decoration: TextDecoration.none),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // List<String> getPassengerNames(List<PassengerModel> passengers) {
  //   List<String> passengerNames = [];
  //   for (var element in passengers) {
  //     passengerNames.add(element.personName);
  //   }
  //   return passengerNames;
  // }
}
