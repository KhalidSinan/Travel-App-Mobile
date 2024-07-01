// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/country_model.dart';
import 'package:travelapp_flutter/features/flight_booking/data/models/trip_date_model.dart';

// ignore: must_be_immutable
class FlightDetailsCard extends StatelessWidget {
  FlightDetailsCard(
      {super.key,
      this.image,
      this.logo,
      this.airline,
      this.source,
      this.destination,
      this.srcairport,
      this.desairport,
      this.departure,
      this.arrival,
      this.duration,
      this.flightPrice});
  String? image;
  String? logo;
  String? airline;
  CountryModel? source;
  CountryModel? destination;
  String? srcairport;
  String? desairport;
  DateInfo? departure;
  DateInfo? arrival;
  String? duration;
  double? flightPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 50, width: 50,
              child: Image.network(logo!),
              //CustomImage(image:logo!);
            ),
            const SizedBox(width: 16),
            Text(
              airline!,
              overflow: TextOverflow.fade,
              style: Styles.heading.copyWith(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Themes.primary,
                    size: 30,
                  ),
                  Text(
                    source!.country!,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              srcairport!,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                image!,
                height: 90,
              ),
            ),
            Text(
              desairport!,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Themes.primary,
                    size: 30,
                  ),
                  Text(
                    destination!.country!,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Departure',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            departure!.date,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            departure!.time!,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalDivider(
                width: 10,
                thickness: 1,
              ),
              Column(
                children: [
                  const Text(
                    'Arrival',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            arrival!.date,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            arrival!.time!,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                FontAwesomeIcons.moneyCheckDollar,
                color: Themes.third,
                size: 25,
              ),
            ),
            Text(
              '\$$flightPrice',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                Icons.timelapse,
                color: Themes.third,
                size: 30,
              ),
            ),
            Text(
              duration!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }
}
