import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/6_schedule_page.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.place,
    required this.city,
    required this.step,
  });

  final PlaceModel place;
  final String city;
  final int step;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<OrganizingTripCubit>(context)
            .updateTripSchedule(city, step, place);
         Get.to(SchedulePage());
        //go back to schedualing page and add the place to the day list
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Themes.secondary,
          border: Border.symmetric(
            vertical: BorderSide(color: Themes.primary, width: 3),
            horizontal: BorderSide(color: Themes.primary, width: 0.8),
          ),
          borderRadius: BorderRadiusDirectional.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 23),
            ),
            const SizedBox(height: 8),
            Text(
              place.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: Themes.third,
                ),
                const SizedBox(width: 6),
                Text(
                  place.address.address,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: Themes.third,
                ),
                const SizedBox(width: 6),
                Text(
                  '+${place.phoneNumber.countryCode} ${place.phoneNumber.number}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
