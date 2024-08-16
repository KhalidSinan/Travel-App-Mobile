import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/info_organized_group_trip_page.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/form_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/1_persons_days_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/2_date_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/3_travel_destinations_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/4_tickets_review_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/5_hotel_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/6_schedule_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/7_review_orgnizing_trip_page.dart';

class OrganizingTripPageBody extends StatelessWidget {
  const OrganizingTripPageBody({
    super.key,
    required this.controller,
    required this.groupTrip,
  });

  final PageController controller;
  final bool groupTrip;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const PersonsDaysSelection(),
        const DateSelection(),
        const DestinationsSelection(),
        const TicketsReviewPage(),
        const HotelSelectionPage(),
        SchedulePage(
          destinations:
              BlocProvider.of<OrganizingTripCubit>(context).destinations,
          onScheduleBack: () {
            BlocProvider.of<OrganizingTripCubit>(context).onPrevious();
          },
          onScheduleDone: (schedule, places) {
            BlocProvider.of<OrganizingTripCubit>(context)
                .setTripSchedule(schedule);
            BlocProvider.of<OrganizingTripCubit>(context).setPlaces(places);
            BlocProvider.of<OrganizingTripCubit>(context).onNext();
          },
        ),
        const ReviewOrgnizingTrip(),
        !groupTrip
            ? FormPage(
                trip: BlocProvider.of<OrganizingTripCubit>(context),
                seats:
                    BlocProvider.of<OrganizingTripCubit>(context).numberPerson!,
                classType: BlocProvider.of<OrganizingTripCubit>(context)
                    .getSeatClass(),
                onBack: () =>
                    BlocProvider.of<OrganizingTripCubit>(context).onPrevious(),
              )
            : const InfoOrganizedGroupTripPage(),
      ],
    );
  }
}
