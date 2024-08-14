import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/presentation/views/my_reservations_page.dart';
import 'package:travelapp_flutter/features/home/presentation/views/my_trips.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My History',
            style: Styles.heading2.copyWith(fontSize: 22, color: Colors.black),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const MyReservationsPage());
                  },
                  child: Card(
                    surfaceTintColor: Themes.primary,
                    color: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.creditCard,
                            size: 37,
                            color: Themes.primary,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Reservations',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const MyTripsPage());
                  },
                  child: Card(
                    surfaceTintColor: Themes.primary,
                    color: Colors.white,
                    elevation: 2,
                    shadowColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.suitcaseRolling,
                            size: 40,
                            color: Themes.primary,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Trips',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
