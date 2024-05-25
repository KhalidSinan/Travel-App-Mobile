import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/room_card.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/room_types_list.dart';

class HotelRoomsPageBody extends StatelessWidget {
  const HotelRoomsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.meeting_room,
                      color: Colors.grey[600],
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    ': 5',
                    style: Styles.content.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          ],
          leading: const CustomBackButton(),
          pinned: true,
          title: Text(
            'Alvador Hotel Rooms',
            style: Styles.heading.copyWith(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: RoomTypesList(),
        ),
        SliverList.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const RoomCard();
          },
        ),
      ],
    );
  }
}
