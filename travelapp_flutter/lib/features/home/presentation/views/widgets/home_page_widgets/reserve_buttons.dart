import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/plane_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/hotel_search_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/1_persons_days_selection_page.dart';

class ReserveButtons extends StatelessWidget {
  const ReserveButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Take a reservation',
            style: Styles.heading2.copyWith(fontSize: 22, color: Colors.black),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('flights');
                  },
                  child: Card(
                    surfaceTintColor: Themes.primary,
                    color: Colors.white,
                    elevation: 3,
                    shape: const CircleBorder(),
                    shadowColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Lottie.asset(
                        Assets.airplane,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                height: 110,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const PersonsDaysSelection());
                  },
                  child: Card(
                    surfaceTintColor: Colors.white,
                    color: Themes.primary.withOpacity(0.6),
                    elevation: 3,
                    shape: const CircleBorder(),
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Lottie.asset(
                        Assets.trip,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.28,
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('hotelsSearch');
                  },
                  child: Card(
                    surfaceTintColor: Themes.primary,
                    color: Colors.white,
                    elevation: 3,
                    shape: const CircleBorder(),
                    shadowColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Lottie.asset(
                        Assets.hotel,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
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
