import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_for_destination_model.dart';

class CardSelectHotel extends StatelessWidget {
  const CardSelectHotel({
    super.key,
    required this.hotelForDestinationModel,
  });

  final HotelForDestinationModel hotelForDestinationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
        left: 8,
        right: 8,
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Themes.primary)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        hotelForDestinationModel.hotelName,
                        style: Styles.heading.copyWith(fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.calendarDays,
                          color: Colors.grey[600],
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${hotelForDestinationModel.numDays}',
                          style: TextStyle(
                            color: Themes.third,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Total Price :',
                      style: Styles.subtitle.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${hotelForDestinationModel.totalPrice}',
                        style: Styles.subtitle.copyWith(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
