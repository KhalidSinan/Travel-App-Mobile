import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/schedule_cubit/schedule_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/6_schedule_widgets/places_widgets/place_card.dart';

class PlacesList extends StatefulWidget {
  const PlacesList(
      {super.key,
      required this.category,
      required this.city,
      required this.step});
  final String category, city;
  final int step;

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
    return BlocBuilder<ScheduleCubit, ScheduleStates>(
      builder: (context, state) {
        if (state is GetPlacesSuccess) {
          List<PlaceModel> places =
              BlocProvider.of<ScheduleCubit>(context).places;
          if (places.isNotEmpty) {
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0) const SizedBox(height: 10),
                    PlaceCard(
                      schedule: BlocProvider.of(context),
                      place: places[index],
                      city: widget.city,
                      step: widget.step,
                    ),
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
            child: CustomLoading(),
          );
        }
      },
    );
  }

  void getPlaces() async {
    await BlocProvider.of<ScheduleCubit>(context)
        .getPlaces(city: widget.city, category: widget.category);
  }
}
