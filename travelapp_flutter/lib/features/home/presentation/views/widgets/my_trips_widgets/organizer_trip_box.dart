import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_marquee/text_marquee.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/data/models/organizer_trips_model.dart';

class OrganizerTripBox extends StatelessWidget {
  const OrganizerTripBox({super.key, this.trip});
  final OrganizerTripsModel? trip;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey[300]!,
                Colors.white,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                offset: Offset(-3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_city_rounded,
                    color: Themes.primary,
                    size: 26,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    trip!.source,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextMarquee(
                trip!.destenations,
                style: const TextStyle(fontSize: 18),
                spaceSize: 40,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.userGroup,
                        color: Colors.grey[800],
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        trip!.people,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Icon(
                          Icons.view_day_rounded,
                          color: Colors.grey[800],
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${trip!.days} Days',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    trip!.date,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '\$${trip!.price}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
