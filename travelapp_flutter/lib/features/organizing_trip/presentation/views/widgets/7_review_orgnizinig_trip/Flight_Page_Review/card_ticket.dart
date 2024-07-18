import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/assets.dart';

class CardTicketFlightReview extends StatelessWidget {
  const CardTicketFlightReview({
    super.key,
  });
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
            const Flexible(
              child: AutoSizeText(
                "AirlinAsia Syria",
                style: TextStyle(color: Colors.white),
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
            const Flexible(
              child: AutoSizeText(
                "Aleppo International AirPort",
                style: TextStyle(color: Colors.white),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Syria",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Row(
                  children: [
                    Text(
                      "12/5/2024,11am",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "12:50",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
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
            const Flexible(
              child: AutoSizeText(
                "Jejo International Airport",
                style: TextStyle(color: Colors.white),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Korea",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Row(
                  children: [
                    Text(
                      "12/5/2024, 12pm",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "02:50",
                      style: TextStyle(fontSize: 15, color: Colors.white),
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
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
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
                            text: "21:50",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                  const Text(
                    "${144.03}\$",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
