import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_card_ticket.dart';

class AppBarDetailsCard extends StatelessWidget {
  const AppBarDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      flexibleSpace: FlexibleSpaceBar(
        background: CarouselSlider(
            carouselController: CarouselController(),
            options: CarouselOptions(
                height: 450,
                initialPage: 0,
                viewportFraction: 1,
                enableInfiniteScroll: false),
            items: List.generate(2, (index) => const CardTicket())),
      ),
    );
  }
}
