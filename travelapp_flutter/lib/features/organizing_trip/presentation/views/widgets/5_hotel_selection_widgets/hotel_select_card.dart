import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotel_select_custom_button.dart';

class CardSelectHotel extends StatelessWidget {
  const CardSelectHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
      child: Container(
        decoration: HotelSelectCardDecoration(),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Paris',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                CustomButtonSelectHotel(
                  label: 'select hotel',
                  onPressed: () {},
                  suffix: Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 20,
                    color: Themes.primary,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Themes.primary)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hotels Name',
                            style: Styles.heading.copyWith(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 160,
                          ),
                          Icon(
                            FontAwesomeIcons.bed,
                            color: Colors.grey[600],
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Themes.third,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
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
                              r'$1000',
                              style:
                                  Styles.subtitle.copyWith(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
    
  }




   BoxDecoration HotelSelectCardDecoration() {
    return BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: Themes.primary, width: 2),
    );
  }
}