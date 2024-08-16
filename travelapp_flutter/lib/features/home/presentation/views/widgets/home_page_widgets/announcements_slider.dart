import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/organized_group_trip_details_page.dart';
import 'package:travelapp_flutter/features/home/data/models/announcement_model.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class AnnouncementsSlider extends StatefulWidget {
  const AnnouncementsSlider({super.key, required this.isOrganizer});
  final bool isOrganizer;
  @override
  State<AnnouncementsSlider> createState() => _AnnouncementsSliderState();
}

class _AnnouncementsSliderState extends State<AnnouncementsSlider> {
  final PageController controller = PageController();
  List<AnnouncementModel> announcement = [];

  @override
  void initState() {
    super.initState();
    announcement = BlocProvider.of<HomeCubit>(context).announcements;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 200,
          viewportFraction: 1,
          autoPlay: announcement.isNotEmpty ? true : false,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          autoPlayInterval: const Duration(seconds: 6),
        ),
        itemCount: announcement.isNotEmpty ? announcement.length : 1,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: const Offset(0, 195),
                    blurRadius: 4,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Card(
                surfaceTintColor: Themes.secondary,
                color: Themes.secondary,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: announcement.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => OrganizedGroupTripDetailsPage(
                                    tripId: announcement[index].tripId,
                                    isOrganizer: widget.isOrganizer,
                                  ),
                                );
                              },
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        announcement[index].title,
                                        style: Styles.heading2
                                            .copyWith(fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        announcement[index].body,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black54),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Tap for more details',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Image.asset(
                                getPhoto(Random().nextInt(4))!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Text(
                            'No announcements to show',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? getPhoto(int? num) {
    switch (num) {
      case 0:
        return Assets.adv1;
      case 1:
        return Assets.adv2;
      case 2:
        return Assets.adv3;
      case 3:
        return Assets.adv4;
      default:
        return null;
    }
  }
}
