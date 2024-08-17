import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/organizing_trip_page.dart';
import 'package:travelapp_flutter/features/settings/presentation/view_model/profile_cubit/profile_cubit.dart';

class ReserveButtons extends StatefulWidget {
  const ReserveButtons({super.key});

  @override
  State<ReserveButtons> createState() => _ReserveButtonsState();
}

class _ReserveButtonsState extends State<ReserveButtons> {
  bool? isOrganizer;

  @override
  void initState() {
    super.initState();
    isOrganizer = BlocProvider.of<ProfilePageCubit>(context).organizer;
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
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
              if (isOrganizer == true)
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.32,
                  height: 110,
                  child: SpeedDial(
                    elevation: 0,
                    overlayOpacity: 0.6,
                    openCloseDial: isDialOpen,
                    childrenButtonSize: const Size(100, 100),
                    backgroundColor: Colors.transparent,
                    direction: SpeedDialDirection.down,
                    shape: const CircleBorder(),
                    children: [
                      SpeedDialChild(
                        elevation: 8,
                        shape: const CircleBorder(),
                        backgroundColor: Colors.grey[300],
                        labelWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() =>
                                    const OrganizingTripPage(groupTrip: false));
                                isDialOpen.value = false;
                              },
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  children: [
                                    Icon(FontAwesomeIcons.person,
                                        color: Themes.primary),
                                    const Text('Single'),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                Get.to(() =>
                                    const OrganizingTripPage(groupTrip: true));
                                isDialOpen.value = false;
                              },
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                child: Column(
                                  children: [
                                    Icon(FontAwesomeIcons.peopleGroup,
                                        color: Themes.primary),
                                    const Text('Group'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    child: Card(
                      surfaceTintColor: Colors.white,
                      color: Themes.primary.withOpacity(0.6),
                      elevation: 3,
                      shape: const CircleBorder(),
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Lottie.asset(
                          Assets.trip,
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              if (isOrganizer == false)
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.32,
                  height: 110,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const OrganizingTripPage(groupTrip: false));
                    },
                    child: Card(
                      surfaceTintColor: Colors.white,
                      color: Themes.primary.withOpacity(0.6),
                      elevation: 3,
                      shape: const CircleBorder(),
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
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
