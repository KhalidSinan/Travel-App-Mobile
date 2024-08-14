import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_for_destination_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/hotel_reservation_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/6_schedule_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/7_review_orgnizing_trip_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/city_and_hotel_select_card_.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';

class HotelSelectionBody extends StatefulWidget {
  const HotelSelectionBody({super.key});

  @override
  State<HotelSelectionBody> createState() => _HotelSelectionBodyState();
}

class _HotelSelectionBodyState extends State<HotelSelectionBody> {
  @override
  Widget build(BuildContext context) {
    List destinations =
        BlocProvider.of<OrganizingTripCubit>(context).destinations;
    int? numberPerson =
        BlocProvider.of<OrganizingTripCubit>(context).numberPerson;

    List startDates = BlocProvider.of<OrganizingTripCubit>(context).startDates;

    HotelReservationModel? allHotels =
        BlocProvider.of<HotelInformationCubit>(context).allHotels;

<<<<<<< HEAD
    List<HotelForDestinationModel>? hotels = allHotels?.hotels;
=======
    List<HotelForDestinationModel?> hotels = allHotels.hotels;
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529

    return SafeArea(
      child: Column(
        children: [
<<<<<<< HEAD
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: destinations.length,
              itemBuilder: (context, i) {
                return CardCityAndSelectHotel(
                  countryName: destinations[i]['city'],
                  numDays: destinations[i]['days'],
                  startDate: startDates[i],
                  numberPerson: numberPerson!,
                  hotelForDestinationModel: hotels![i],
                );
              },
=======
          BlocBuilder<HotelInformationCubit, HotelInformationState>(
            builder: (context, state) => Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: destinations.length,
                itemBuilder: (context, i) {
                  return CardCityAndSelectHotel(
                    countryName: destinations[i].city,
                    numDays: destinations[i].days,
                    startDate: startDates[i],
                    numberPerson: numberPerson!,
                    hotelForDestinationModel: hotels[i],
                    index: i,
                  );
                },
              ),
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          NextButton(onTap: () {
            BlocProvider.of<OrganizingTripCubit>(context).saveHotels(
              allHotels:
                  BlocProvider.of<HotelInformationCubit>(context).allHotels,
            );
            Get.to(() => SchedulePage(
                  destinations: BlocProvider.of<OrganizingTripCubit>(context)
                      .destinations,
                  onScheduleDone: (schedule, places) {
                    BlocProvider.of<OrganizingTripCubit>(context)
                        .setTripSchedule(schedule);
                    BlocProvider.of<OrganizingTripCubit>(context)
                        .setPlaces(places);
                    Get.to(() => const ReviewOrgnizingTrip());
                  },
                ));
          }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
