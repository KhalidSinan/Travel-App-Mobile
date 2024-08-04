import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/form_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/open_flight.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/open_hotel.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/open_places.dart';

class ReviewOrgnizingTripBody extends StatelessWidget {
  const ReviewOrgnizingTripBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OpenHotel(),
              OpenFlight(),
            ],
          ),
          const OpenPlaces(),
          SizedBox(
              width: double.infinity,
              child: CustomButton(
                  onPressed: () {
                    Get.to(() => FormPage(
                          seats: BlocProvider.of<OrganizingTripCubit>(context)
                              .numberPerson!,
                          classType:
                              BlocProvider.of<OrganizingTripCubit>(context)
                                  .getSeatClass(),
                          tripFrom: true,
                        ));
                  },
                  label: "Reviewed")),
        ],
      ),
    );
  }
}
