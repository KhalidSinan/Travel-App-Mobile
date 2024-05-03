import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_button.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';
import 'package:dio/dio.dart';

class ConfirmationStepButtons extends StatefulWidget {
  const ConfirmationStepButtons({
    super.key,
  });

  @override
  State<ConfirmationStepButtons> createState() =>
      _ConfirmationStepButtonsState();
}

class _ConfirmationStepButtonsState extends State<ConfirmationStepButtons> {
  // Map<String, dynamic>? paymentIntent;
  // createPaymentIntent() async {
  //   try {
  //     Map<String, dynamic> body = {
  //       "amount": "1000",
  //     };
  //     dynamic response = Dio().post(
  //       'https://05b6-169-150-196-84.ngrok-free.app/flights/payment-sheet',
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           // "Authorization":
  //           //     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MmY2OGMyMWZiMTU5ZjY4ZWZlNzg5ZiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTQ1NDUxODF9.XJAqvLxZYozqrus1Zjjk9OyA_RfoPZeuD4MhIMHhPO0",
  //         },
  //       ),
  //       data: body,
  //     );
  //     return response.data;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // void makePayment() async {
  //   try {
  //     paymentIntent = await createPaymentIntent();

  //     var gpay = const PaymentSheetGooglePay(
  //         merchantCountryCode: "US", currencyCode: "US", testEnv: true);
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //             paymentIntentClientSecret: paymentIntent!['client_secret'],
  //             style: ThemeMode.light,
  //             merchantDisplayName: "Sabir",
  //             googlePay: gpay));
  //     displayPaymentSheet();
  //   } catch (e) {}
  // }

  // void displayPaymentSheet() async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet();
  //     print("Done");
  //   } catch (e) {
  //     print("Failed");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return BlocBuilder<ConfirmFlightReservationCubit,
        ConfirmFlightReservationState>(
      builder: (context, state) {
        ReservationModel? reservation =
            BlocProvider.of<ConfirmFlightReservationCubit>(context).reservation;
        return (state is LoadingConfirmFlightReservationState)
            ? SizedBox()
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
                            days: reservation == null ? 0 : reservation.days,
                            hours: reservation == null ? 0 : reservation.hours,
                            minutes:
                                reservation == null ? 0 : reservation.minutes,
                            seconds:
                                reservation == null ? 0 : reservation.seconds),
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
                               // makePayment();
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
                                    .postRservationConfirmation(
                                        id: "662fbfd9402bb6277a93fc04");
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
