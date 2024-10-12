import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Hotel_Page_Review/hotel_review_body.dart';

class HotelPageReview extends StatelessWidget {
  const HotelPageReview({super.key});

  @override
  Widget build(BuildContext context) {
    final allHotels = BlocProvider.of<OrganizingTripCubit>(context).allHotels;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(298),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(25)),
              color: Themes.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                const CustomBackButton(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  "Informations About Your Selected Hotels",
                  style: TextStyle(
                      color: Themes.third,
                      fontWeight: FontWeight.w200,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  "Total journey Number Hotel : ${allHotels!.hotels.length}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  "Total Price of Hotels : ${allHotels.getAllHotelsPrice()}\$",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 13,
                ),
              ],
            ),
          )),
      body: const HotelReviewBody(),
    );
  }
}
