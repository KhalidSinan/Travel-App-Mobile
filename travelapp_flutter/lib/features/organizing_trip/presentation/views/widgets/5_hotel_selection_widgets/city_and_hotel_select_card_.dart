import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotel_select_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotel_select_custom_button.dart';

class CardCityAndSelectHotel extends StatelessWidget {
  const CardCityAndSelectHotel({super.key, required this.countryName, required this.numberPerson});
  final String countryName;
  final int numberPerson;
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
                Text(countryName,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                CustomButtonSelectHotel(
                  label: 'select hotel',
                  onPressed: () {
                    // Get.to(HotelSelectionPage(
                    //     city: countryName,
                    //     startDate: startDate,
                    //     numDays: numDays,
                    //     numRooms: numberPerson));
                  },
                  suffix: Icon(
                    FontAwesomeIcons.chevronRight,
                    size: 20,
                    color: Themes.primary,
                  ),
                )
              ],
            ),
          ),
          CardSelectHotel(),
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