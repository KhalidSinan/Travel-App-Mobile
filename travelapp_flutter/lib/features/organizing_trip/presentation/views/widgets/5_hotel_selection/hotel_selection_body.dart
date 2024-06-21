import 'package:flutter/material.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection/hotel_select_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/next_button.dart';

class HotelSelectionBody extends StatelessWidget {
  const HotelSelectionBody({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, i) {
                  return CardSelectHotel();
                }),
          ),
          const SizedBox(
            height: 10,
          ),
        NextButton(onTap: (){}) ,
              const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
 
}