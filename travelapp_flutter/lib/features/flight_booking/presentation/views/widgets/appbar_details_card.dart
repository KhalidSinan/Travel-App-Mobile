import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/reservation_model.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/confirm_flight_reservation_cubit/confirm_flight_reservation_cubit_states.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_card_ticket.dart';

class AppBarDetailsCard extends StatelessWidget {
  const AppBarDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmFlightReservationCubit,
        ConfirmFlightReservationState>(
      builder: (context, state) {
        ReservationModel? reservation =
            BlocProvider.of<ConfirmFlightReservationCubit>(context).reservation;
        return SliverAppBar(
          elevation: 0,
          backgroundColor: const Color(0xfff2f4f3),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              FontAwesomeIcons.chevronLeft,
              size: 20,
              color: Colors.white,
            ),
          ),
          expandedHeight: 290,
          flexibleSpace: (reservation == null &&
                  state is LoadingConfirmFlightReservationState)
              ? FlexibleSpaceBar(
                  background: Shimmer.fromColors(
                    period: const Duration(milliseconds: 2000),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                )
              : FlexibleSpaceBar(
                  background: CarouselSlider(
                    carouselController: CarouselController(),
                    options: CarouselOptions(
                        height: 450,
                        initialPage: 0,
                        viewportFraction: 1,
                        enableInfiniteScroll: false),
                    items: List.generate(
<<<<<<< HEAD
                      reservation!.isTwoWay ? 2 : 1,
                      (index) => index == 0
                          ? CardTicket(flight: reservation.flight)
                          : CardTicket(flight: reservation.flightBack),
=======
                      reservation!.reservationType ? 2 : 1,
                      (index) => index == 0
                          ? CardTicket(flight: reservation.flight)
                          : CardTicket(flight: reservation.flightBack!),
>>>>>>> Khalid
                    ),
                  ),
                ),
        );
      },
    );
  }
}
