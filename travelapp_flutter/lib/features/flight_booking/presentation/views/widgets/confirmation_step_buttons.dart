import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:slide_countdown/slide_countdown.dart';
=======
import 'package:slide_countdown/slide_countdown.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
>>>>>>> Khalid
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';

class ConfirmationStepButtons extends StatefulWidget {
  const ConfirmationStepButtons({
    super.key,
  });

  @override
  State<ConfirmationStepButtons> createState() =>
      _ConfirmationStepButtonsState();
}

class _ConfirmationStepButtonsState extends State<ConfirmationStepButtons> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return BlocBuilder<ConfirmFlightReservationCubit,
        ConfirmFlightReservationState>(
      builder: (context, state) {
<<<<<<< HEAD
        ReservationModel? reservation =
            BlocProvider.of<ConfirmFlightReservationCubit>(context).reservation;
=======
        final confirmCubit =
            BlocProvider.of<ConfirmFlightReservationCubit>(context);
        ReservationModel? reservation = confirmCubit.reservation;
        bool isConfirmed = confirmCubit.isConfirmed;
        if (isConfirmed) return const SizedBox();
>>>>>>> Khalid
        return (state is LoadingConfirmFlightReservationState)
            ? const SizedBox()
            : Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: SlideCountdownSeparated(
                        padding: EdgeInsets.zero,
                        separatorPadding: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.zero),
                        style: const TextStyle(
                            backgroundColor: Colors.transparent, fontSize: 15),
                        duration: Duration(
<<<<<<< HEAD
                            days: reservation == null ? 0 : reservation.days,
                            hours: reservation == null ? 0 : reservation.hours,
                            minutes:
                                reservation == null ? 0 : reservation.minutes,
                            seconds:
                                reservation == null ? 0 : reservation.seconds),
=======
                          days: reservation == null
                              ? 0
                              : reservation.remainingTime.days,
                          hours: reservation == null
                              ? 0
                              : reservation.remainingTime.hours,
                          minutes: reservation == null
                              ? 0
                              : reservation.remainingTime.minutes,
                          seconds: reservation == null
                              ? 0
                              : reservation.remainingTime.seconds,
                        ),
>>>>>>> Khalid
                        icon: Icon(
                          Icons.alarm,
                          color: Themes.primary,
                          size: 20,
                        ),
                        onDone: () => Get.back(),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Themes.primary.withOpacity(0.9),
                        ),
                      ),
                      width: screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomTextButton(
                              onPressed: () {
<<<<<<< HEAD
                              
=======
>>>>>>> Khalid
                                Get.back();
                              },
                              label: "Later",
                            ),
                          ),
                          Expanded(
                            child: CustomButton(
                              onPressed: () async {
                                await BlocProvider.of<
                                        ConfirmFlightReservationCubit>(context)
<<<<<<< HEAD
                                    .postRservationConfirmation(
                                        id: "662fbfd9402bb6277a93fc04");
=======
                                    .postReservationConfirmation(
                                  id: BlocProvider.of<
                                              ConfirmFlightReservationCubit>(
                                          context)
                                      .reservationId,
                                );
>>>>>>> Khalid
                              },
                              label: "Confirm",
                              isFlat: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
