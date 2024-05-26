import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
            itemCount: hotels.totalHotels,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Themes.primary),
                    borderRadius: BorderRadius.circular(15),
                    color: Themes.secondary,
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  height: 190,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(9, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            fit: BoxFit.fill,
                            "assets/images/hotel.jpg",
                            height: 130,
                            width: 140,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, right: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: AutoSizeText(
                                hotels.hotels[index].name,
                                softWrap: true,
                                maxLines: 1,
                                minFontSize: 10,
                                maxFontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: AutoSizeText(
                                "${hotels.hotels[index].location} |${hotels.hotels[index].distanceFromCityCenter} Km from center",
                                softWrap: true,
                                maxLines: 1,
                                minFontSize: 7,
                                maxFontSize: 11,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  index < hotels.hotels[index].stars
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: index <  hotels.hotels[index].stars
                                      ? Colors.yellow
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Row(
                              children: [
                                Text(
                                  "start from : ",
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  "price",
                                 // hotels.hotels[index].price;
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }
    });
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
      ),
    ),
  );
}
