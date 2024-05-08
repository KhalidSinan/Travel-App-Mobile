import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/airline_model.dart';

class AirlineInfo extends StatelessWidget {
  const AirlineInfo({
    super.key,
    required this.airline,
  });
  final AirlineModel airline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          // backgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          radius: 20,
          child: Image.network(airline.logo),
        ),
        const SizedBox(width: 8),
        Text(
          airline.name,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
