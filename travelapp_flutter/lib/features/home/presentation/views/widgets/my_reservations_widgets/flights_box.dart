import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/confirm_flight_reservation_page.dart';
import 'package:travelapp_flutter/features/home/data/models/flight_reservations_model.dart';

class FlightsBox extends StatelessWidget {
  const FlightsBox({super.key, required this.flight});
  final FlightReservationsModel? flight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: GestureDetector(
        onTap: () {
          Get.to(
            ConfirmFlightReservationPage(
              reservationId: flight!.id,
              completed: flight!.completed,
            ),
          );
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey[300]!,
                Colors.white,
                //Colors.grey[100]!,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                offset: Offset(-3, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    flight!.source,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      flight!.twoWay == 'Two-Way'
                          ? Icons.connecting_airports
                          : FontAwesomeIcons.plane,
                      color: Themes.primary,
                      size: flight!.twoWay == 'Two-Way' ? 38 : 22,
                    ),
                  ),
                  Text(
                    flight!.destination,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: flight!.twoWay == 'Two-Way' ? 5 : 12),
              Row(
                children: [
                  Icon(
                    Icons.flight_takeoff,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      flight!.sAirpost,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.flight_land,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      flight!.dAirport,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    flight!.date,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '\$${flight!.price}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
