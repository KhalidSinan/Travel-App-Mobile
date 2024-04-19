import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/ticket_booking/presentation/views/widgets/all_flights_page_body.dart';

class AllFlightsPage extends StatelessWidget {
  const AllFlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AllFlightsPageBody(),
      ),
    );
  }
}
