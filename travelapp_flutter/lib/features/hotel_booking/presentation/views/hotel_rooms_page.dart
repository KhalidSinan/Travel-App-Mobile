import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_rooms_page_body.dart';

class HotelRoomsPage extends StatelessWidget {
  const HotelRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HotelRoomsPageBody(),
      ),
    );
  }
}
