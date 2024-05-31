import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/Top_Container.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/edit_container.dart';


class CustomStack extends StatelessWidget {
  const CustomStack({
    super.key,
    required this.heightbackground,
    required this.heightCard,
  });

  final double heightbackground;
  final double heightCard;

  @override
  Widget build(BuildContext context) {
    final double toppositioned = heightbackground - (heightCard / 2) - 30;
    final double bottom = heightCard / 2 - 20;

    return SliverToBoxAdapter(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          TopContainerHotel(
            heightbackground: heightbackground,
            bottom: bottom,
          ),
          EditContainer(toppositioned: toppositioned, heightCard: heightCard)
        ],
      ),
    );
  }
}
