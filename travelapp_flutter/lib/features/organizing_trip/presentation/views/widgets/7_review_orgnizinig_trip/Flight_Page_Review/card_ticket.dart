import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/flight_model.dart';

class CardTicketFlightReview extends StatelessWidget {
  const CardTicketFlightReview({
    super.key,
    required this.flight,
  });
  final Flight flight;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    return Container(
      padding: const EdgeInsets.all(16),
      height: screenHeight * 0.35,
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          opacity: 0.8,
          image: AssetImage(Assets.greenSky),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: AutoSizeText(
                flight.airline.name,
                style: const TextStyle(color: Colors.white),
                softWrap: true,
                maxLines: 1,
                minFontSize: 9,
                maxFontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Departure",
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
            Flexible(
              child: AutoSizeText(
                flight.srcAirport,
                style: const TextStyle(color: Colors.white),
                softWrap: true,
                maxLines: 1,
                minFontSize: 9,
                maxFontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flight.source,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      flight.departureDate.date,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      flight.departureDate.time!,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Center(
              child: ClipOval(
                child: Icon(
                  FontAwesomeIcons.planeArrival,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            const Text(
              "Arrival",
              style: TextStyle(color: Colors.white54, fontSize: 13),
            ),
            Flexible(
              child: AutoSizeText(
                flight.desAirport,
                style: const TextStyle(color: Colors.white),
                softWrap: true,
                maxLines: 1,
                minFontSize: 9,
                maxFontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flight.destination,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                Row(
                  children: [
                    Text(
                      flight.arrivalDate.date,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      flight.arrivalDate.time!,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(
                              FontAwesomeIcons.clock,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        TextSpan(
                            text: flight.duration,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                  Text(
                    "${flight.price}\$",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
