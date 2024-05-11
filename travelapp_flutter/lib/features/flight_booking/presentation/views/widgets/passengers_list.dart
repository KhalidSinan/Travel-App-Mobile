import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:info_widget/info_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';

class PassengersList extends StatelessWidget {
  const PassengersList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return BlocBuilder<ConfirmFlightReservationCubit,
        ConfirmFlightReservationState>(
      builder: (context, state) {
        ReservationModel? reservation =
            BlocProvider.of<ConfirmFlightReservationCubit>(context).reservation;
        return (reservation == null &&
                state is LoadingConfirmFlightReservationState)
            ? SliverFixedExtentList(
                itemExtent: 100,
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => Shimmer.fromColors(
                    period: const Duration(milliseconds: 2000),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      width: screenWidth,
                      height: 60,
                    ),
                  ),
                ),
              )
            : SliverFixedExtentList(
                itemExtent: 100,
                delegate: SliverChildBuilderDelegate(
                  childCount: reservation!.seat,
                  (context, int index) => Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12.withOpacity(0.05),
                    ),
                    width: screenWidth,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            WidgetSpan(
                              child: Icon(
                                FontAwesomeIcons.person,
                                color: Themes.primary,
                                size: 20,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' ${reservation.flight.reservations![index].personName.toUpperCase()} ',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          ]),
                        ),
                        InfoWidget(
                            infoText: getPassengerData(reservation, index),
                            iconData: FontAwesomeIcons.info,
                            iconColor: Themes.primary),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}

// String getPassengerData(ReservationModel passenger) {
//   String infoText =
//       "name: ${passenger.flight.reservations!.personName}\npassport: ${passenger.flight.reservations!.id}\n seatnumber: ${passenger.flight.reservations!.seatNumber}\n seatprice: ${passenger.flight.reservations!.price}\n${passenger.isTwoWay ? "Flight Back info \n seatnumber${passenger.flightBack!.reservations!.seatNumber}\n seatprice: ${passenger.flightBack!.reservations!.price}  " : " "}";

//   return infoText;
// }

String getPassengerData(ReservationModel passenger, int index) {
  final reservations = passenger.flight.reservations;
  final backReservations = passenger.flightBack?.reservations;

  StringBuffer infoText = StringBuffer()
    ..writeln('Name: ${reservations![index].personName}')
    ..writeln('Passport: ${reservations[index].passport}')
    ..writeln('Seat Number: ${reservations[index].seatNumber}')
    ..writeln('Seat Price: ${reservations[index].price}');

  if (backReservations != null) {
    infoText
      ..writeln('Flight Back Info')
      ..writeln('Seat Number: ${backReservations[index].seatNumber}')
      ..writeln('Seat Price: ${backReservations[index].price}');
  }

  return infoText.toString();
}
