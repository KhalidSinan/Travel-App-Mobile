import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/widgets/custom_tag.dart';

class ClassCard extends StatelessWidget {
  const ClassCard(
      {super.key,
      required this.classType,
      required this.load,
      required this.features});
  final String classType;
  final int load;
  final List<String>? features;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Themes.primary,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                classType,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              Text(
                'Load : $load kg',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Themes.third,
                  size: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Features',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: features!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: CustomTag(
                    text: features![index],
                    icon: features![index] == 'Buffet'
                        ? Icons.restaurant
                        : features![index] == 'Bedding'
                            ? Icons.bed
                            : features![index] == 'Beverages'
                                ? Icons.local_bar
                                : features![index] == 'Comfort'
                                    ? Icons.event_seat
                                    : features![index] == 'Toiletries'
                                        ? Icons.bathtub
                                        : features![index] == 'Wifi'
                                            ? FontAwesomeIcons.rss
                                            : features![index] == 'Lie seats'
                                                ? Icons.airline_seat_flat
                                                : features![index] ==
                                                        'Entertainment'
                                                    ? FontAwesomeIcons.gamepad
                                                    : features![index] ==
                                                            'Suite'
                                                        ? Icons.weekend
                                                        : features![index] ==
                                                                'Pajamas'
                                                            ? FontAwesomeIcons
                                                                .shirt
                                                            : features![index] ==
                                                                    'Drinks'
                                                                ? Icons
                                                                    .local_cafe
                                                                : features![index] ==
                                                                        'TV'
                                                                    ? Icons.tv
                                                                    : features![index] ==
                                                                            'Charging'
                                                                        ? Icons
                                                                            .power
                                                                        : features![index] ==
                                                                                'Meal'
                                                                            ? Icons.room_service
                                                                            : features![index] == 'Backrest'
                                                                                ? Icons.airline_seat_flat_angled
                                                                                : Icons.priority_high,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
