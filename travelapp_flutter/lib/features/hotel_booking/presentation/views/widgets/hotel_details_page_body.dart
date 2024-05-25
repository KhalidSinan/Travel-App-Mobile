import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/image_slider.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/hotel_rooms_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_description.dart';

class HotelDetailsPageBody extends StatelessWidget {
  const HotelDetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
              leading: getBackButton(),
              flexibleSpace: FlexibleSpaceBar(
                background: ImageSlider(
                  images: getHotelImages,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.list(
                children: [
                  // hotel info ( name stars )
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alvador Hotel',
                        style: Styles.heading,
                      ),
                      const Text('⭐⭐⭐⭐'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationDot,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Britain - London - Street1',
                            style: Styles.content.copyWith(
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  // const SizedBox(height: 24),
                  // hotel location
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       'Location',
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 24,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     const SizedBox(height: 8),
                  //     Text(
                  //       'Britain - London - Street1',
                  //       style: Styles.content.copyWith(
                  //         color: Colors.grey[400],
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 24),
                  // hotel description
                  const HotelDescription(
                    description:
                        "a very long description that descripe the hotel and what it is actually a very long description that descripe the hotel and what it is actually a very long description that descripe the hotel and what it is actually a very long description that descripe the hotel and what it is actually",
                  ),
                  // hotel room types
                  // const Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Room Types',
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 24,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     SizedBox(height: 8),
                  //     RoomTypesList(),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomButton(
            onPressed: () => Get.to(() => const HotelRoomsPage()),
            label: "Select Room(s)",
            isFlat: true,
          ),
        ),
      ],
    );
  }

  List<String> get getHotelImages {
    return [
      Assets.nature1,
      Assets.nature2,
      Assets.nature3,
    ];
  }

  Container getBackButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(150),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(radius)),
      ),
      child: const CustomBackButton(color: Colors.white),
    );
  }
}
