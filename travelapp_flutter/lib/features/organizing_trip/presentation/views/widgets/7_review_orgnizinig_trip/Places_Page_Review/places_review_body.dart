import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Places_Page_Review/places_card_review.dart';

class PlacesReviewBody extends StatelessWidget {
  const PlacesReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final places = BlocProvider.of<OrganizingTripCubit>(context).places;
    final destinations =
        BlocProvider.of<OrganizingTripCubit>(context).destinations;
    final tripSchedule =
        BlocProvider.of<OrganizingTripCubit>(context).tripSchedule;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Themes.primary,
        ),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          List<PlaceModel?> places = getAllPlacesForDestination(
            destination: destinations[index].city,
            tripSchedule: tripSchedule,
          );
          return ExpansionTile(
            title: Text(
              "Destination ${index + 1}: ${destinations[index].city}",
              style: const TextStyle(fontSize: 18),
            ),
            children: [
              SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      return PlaceCardReview(place: places[index]!);
                    }),
              ),
            ],
          );
        },
      ),
    );
  }

  List<PlaceModel?> getAllPlacesForDestination({
    required String destination,
    required Map<String, List<Map<String, List<PlaceModel?>>>> tripSchedule,
  }) {
    List<PlaceModel?> places = [];
    for (var step in tripSchedule[destination]!) {
      step.forEach((day, newPlaces) {
        places.addAll(newPlaces);
      });
    }
    return places;
  }
}
