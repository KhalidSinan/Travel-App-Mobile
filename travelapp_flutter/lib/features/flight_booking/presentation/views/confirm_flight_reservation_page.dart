import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/confirm_flight_reservation_page_body.dart';

class ConfirmFlightReservationPage extends StatelessWidget {
  const ConfirmFlightReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size;
    // var screenWidth = screenSize.width;
    //var screenHeight = screenSize.height;
    return const SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xfff2f4f3),
        body: ConfirmFlightReservationPageBody(),
      ),
    );
  }
}
