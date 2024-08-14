import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/place_model.dart';

class NearbyPlaces extends StatefulWidget {
  const NearbyPlaces({super.key});

  @override
  State<NearbyPlaces> createState() => _NearbyPlacesState();
}

class _NearbyPlacesState extends State<NearbyPlaces> {
  List<PlaceModel>? places = [];

  @override
  void initState() {
    super.initState();
    places = BlocProvider.of<HomeCubit>(context).places;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suggestions around you',
            style: Styles.heading2.copyWith(fontSize: 22, color: Colors.black),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: places!.isNotEmpty ? places!.length * 100 : 200,
            child: ListView.builder(
              itemCount: places!.isNotEmpty ? places!.length : 1,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (places!.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'Sorry, there is no places near to you',
                        style: TextStyle(color: Colors.grey[600], fontSize: 15),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Card(
                      surfaceTintColor: Themes.primary,
                      color: Colors.white,
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              places![index].name,
                              overflow:  TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Themes.third),
                                const SizedBox(width: 5),
                                Text(
                                  places![index].address.address!,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
//  if (places == null) {
//                   return const Center(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 30),
//                       child: Text(
//                         'Add your location to get nearby places',
//                         style: TextStyle(color: Colors.grey, fontSize: 15),
//                       ),
//                     ),
//                   );
//                 } else