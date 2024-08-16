import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_hotels_page_widgets/all_hotel_options.dart';

class AllHotelsHeader extends StatelessWidget {
  const AllHotelsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //AllHotelModel hotels;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<AllHotelsCubit, AllHotelStates>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (state is LoadingAllHotelStates &&
                      BlocProvider.of<AllHotelsCubit>(context)
                              .allhotels
                              ?.totalHotels ==
                          null)
                  ? Shimmer.fromColors(
                      period: const Duration(milliseconds: 2000),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[400]!,
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: 20,
                        height: 25,
                      ),
                    )
                  : Row(
                      children: [
                        Text(
                          'All Hotels',
                          style: Styles.heading,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${BlocProvider.of<AllHotelsCubit>(context).allhotels!.totalHotels})',
                          style: Styles.subtitle,
                        ),
                      ],
                    ),
              (state is LoadingAllHotelStates)
                  ? const SizedBox()
                  : const AllHotelsOptions()
            ],
          );
        },
      ),
    );
  }
}
