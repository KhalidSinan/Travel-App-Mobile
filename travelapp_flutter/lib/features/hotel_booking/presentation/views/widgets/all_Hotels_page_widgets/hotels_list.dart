import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/all_hotelModel.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class HotelsList extends StatelessWidget {
  const HotelsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllHotelsCubit, AllHotelStates>(
      builder: (context, state) {
        if (state is NoHotelsState) {
          return const SliverFillRemaining(
            child: Center(
              child: Text("No Hotels Available"),
            ),
          );
        } else if (state is LoadingAllHotelStates) {
          return SliverList.builder(
            itemBuilder: shimmerHotelsLoading,
            itemCount: 10,
          );
        } else {
          AllHotelModel hotels =
              BlocProvider.of<AllHotelsCubit>(context).allhotels!;
          return SliverList.builder(
            itemCount: hotels.currentPage,
            itemBuilder: (context, index) {
              print(hotels.hotels);
              // http://localhost:5000/images/rooms/00000735.jpg
              return Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(color: Themes.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(5),
                    color: Themes.secondary),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/hotel.jpg"),
                        height: 150,
                        width: 135,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                hotels.hotels[index].name,
                                style: const TextStyle(fontSize: 16),
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "${hotels.hotels[index].location.city}|${hotels.hotels[index].distanceFromCityCenter} Km from center",
                                style: const TextStyle(fontSize: 13),
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (intx) => Icon(
                                  intx < hotels.hotels[index].stars
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: intx < hotels.hotels[index].stars
                                      ? Colors.yellow
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "start from : ",
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  "${hotels.hotels[index].startsFrom}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}

Widget? shimmerHotelsLoading(context, index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Shimmer.fromColors(
      period: const Duration(milliseconds: 2000),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Themes.primary),
          borderRadius: BorderRadius.circular(15),
          color: Themes.secondary,
        ),
        width: MediaQuery.sizeOf(context).width,
        height: 190,
      ),
    ),
  );
}
