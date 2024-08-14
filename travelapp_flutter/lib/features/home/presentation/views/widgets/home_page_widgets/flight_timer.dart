import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/remaining_time_model.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_cubit.dart';

class FlightTimer extends StatefulWidget {
  const FlightTimer({super.key});

  @override
  State<FlightTimer> createState() => _FlightTimerState();
}

class _FlightTimerState extends State<FlightTimer> {
  RemainingTimeModel? timer;

  @override
  void initState() {
    super.initState();
    timer = BlocProvider.of<HomeCubit>(context).timer;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          indent: 25,
          endIndent: 25,
          height: 20,
        ),
        SlideCountdownSeparated(
          padding: EdgeInsets.zero,
          slideDirection: SlideDirection.up,
          decoration: const BoxDecoration(),
          style: TextStyle(
            fontSize: 18,
            color: Themes.third,
            fontWeight: FontWeight.bold,
          ),
          duration: Duration(
            days: timer == null ? 0 : timer!.days,
            hours: timer == null ? 0 : timer!.hours,
            minutes: timer == null ? 0 : timer!.minutes,
            seconds: timer == null ? 0 : timer!.seconds,
          ),
          icon: const Text(
            'Your next flight in ',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
