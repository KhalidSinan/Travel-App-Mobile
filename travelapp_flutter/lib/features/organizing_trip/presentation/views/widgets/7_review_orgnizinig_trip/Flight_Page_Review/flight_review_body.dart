import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Flight_Page_Review/card_ticket.dart';

class FlightReviewBody extends StatelessWidget {
  const FlightReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final flights =
        BlocProvider.of<OrganizingTripCubit>(context).availableFlightModel;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Themes.primary,
        ),
        itemCount: flights.length,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: CardTicketFlightReview(),
        ),
      ),
    );
  }
}
