import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/form_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/form_cubit/form_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/tile_content.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/trip_payment_page.dart';

// ignore: must_be_immutable
class FormPageBody extends StatelessWidget {
  FormPageBody({
    super.key,
    required this.classType,
    required this.seats,
    this.flightsId,
    this.reservationType,
    this.tripForm,
  });

  FormModel? formModel;
  // bool isInitial;
  final List<String>? flightsId;
  final String? reservationType;
  final String classType;
  final int seats;
  bool? tripForm = false;

  @override
  Widget build(BuildContext context) {
    bool isForm = BlocProvider.of<FormCubit>(context).isForm;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.airline_seat_recline_extra,
                size: 33,
                color: Themes.primary,
              ),
              Text(
                ': $seats',
                // isInitial == false ? ' : ${formModel!.seats}' : ' : $seats',
                style: TextStyle(
                  fontSize: 20,
                  color: Themes.primary,
                ),
              ),
              const Spacer(flex: 1),
              Text(
                classType,
                style: TextStyle(
                  fontSize: 20,
                  color: Themes.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: seats,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    childrenPadding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    leading: Icon(
                      Icons.person,
                      size: 33,
                      color: Themes.primary,
                    ),
                    title: Text(
                      BlocProvider.of<FormCubit>(context)
                              .passengers[index]
                              ?.personName
                              .toUpperCase() ??
                          'Seat ${index + 1}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    backgroundColor: Colors.grey[300],
                    textColor: Colors.black,
                    iconColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    collapsedBackgroundColor: Colors.grey[200],
                    collapsedIconColor: Colors.black,
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    expansionAnimationStyle: AnimationStyle(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(seconds: 1),
                    ),
                    children: [
                      TileContent(
                        index: index,
                        classType: classType,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          (!isForm)
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (BlocProvider.of<FormCubit>(context)
                            .checkFormValidity()) {
                          // isInitial = false;
                          if (tripForm == true) {
                            Get.to(() => TripPaymentPage(
                                  trip: BlocProvider.of<OrganizingTripCubit>(
                                      context),
                                  seats:
                                      BlocProvider.of<FormCubit>(context).seats,
                                  passengers:
                                      BlocProvider.of<FormCubit>(context)
                                          .passengers,
                                ));
                            return;
                          }
                          await BlocProvider.of<FormCubit>(context)
                              .makeReservation(
                            flights: flightsId!,
                            reservationType: reservationType!,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Themes.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text(
                        'Pay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
