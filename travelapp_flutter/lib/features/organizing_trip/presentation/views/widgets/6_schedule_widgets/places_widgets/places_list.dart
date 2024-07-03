import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/places_widgets/place_card.dart';

class PlacesList extends StatefulWidget {
  const PlacesList({super.key, required this.category, required this.city});
  final String category, city;

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  @override
  void initState() {
    super.initState();
    getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizingTripCubit, OrganizingTripStates>(
      builder: (context, state) {
        if (state is PlacesSuccess) {
          List<PlaceModel> places =
              BlocProvider.of<OrganizingTripCubit>(context).places;
          if (places.isNotEmpty) {
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0) const SizedBox(height: 10),
                    PlaceCard(place: places[index]),
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                'No available places',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void getPlaces() async {
    await BlocProvider.of<OrganizingTripCubit>(context)
        .getPlaces(city: widget.city, category: widget.category);
  }
}
