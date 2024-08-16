import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/all_hotels_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/hotel_details_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/hotel_card.dart';

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
              return HotelCard(
                onTap: () {
                  Get.to(
                    () => HotelDetailsPage(
                      hotel: hotels.hotels[index],
                      startDate:
                          BlocProvider.of<AllHotelsCubit>(context).startDate,
                      numDays: BlocProvider.of<AllHotelsCubit>(context)
                          .numDays,
                    ),
                  );
                },
                hotel: hotels.hotels[index],
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
