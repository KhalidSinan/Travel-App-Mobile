import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_for_destination_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotel_select_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotel_select_custom_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/destination_hotels_page.dart';

class CardCityAndSelectHotel extends StatelessWidget {
  const CardCityAndSelectHotel({
    super.key,
    required this.countryName,
    required this.numberPerson,
    required this.numDays,
    required this.startDate,
    required this.index,
    this.hotelForDestinationModel,
  });
  final String countryName;
  final int numberPerson;
  final int numDays, index;
  final String startDate;
  final HotelForDestinationModel? hotelForDestinationModel;
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
                    BlocProvider.of<HotelInformationCubit>(context)
                        .onHotelTap(index: index);
                    Get.to(DestinationHotelsPage(
                      city: countryName,
                      startDate: startDate,
                      numDays: numDays,
                      numRooms: numberPerson,
                      bloc: BlocProvider.of<HotelInformationCubit>(context),
                    ));
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
          hotelForDestinationModel == null
              ? const SizedBox(
                  height: 1,
                )
              : CardSelectHotel(
                  hotelForDestinationModel: hotelForDestinationModel!,
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
