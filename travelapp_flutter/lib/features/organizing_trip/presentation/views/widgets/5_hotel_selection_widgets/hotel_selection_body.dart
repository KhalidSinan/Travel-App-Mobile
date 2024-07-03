import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/city_and_hotel_select_card_.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';

class HotelSelectionBody extends StatelessWidget {
  const HotelSelectionBody({super.key});

  @override
  Widget build(BuildContext context) {

    List cities = BlocProvider.of<OrganizingTripCubit>(context).cities;
    int? numberPerson = BlocProvider.of<OrganizingTripCubit>(context).numberPerson;
                                                          
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: cities.length,
              itemBuilder: (context, i) {
                return CardCityAndSelectHotel(
                  countryName: cities[i]['countryName'],
                  numberPerson: numberPerson!,
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          NextButton(onTap: () {}),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
