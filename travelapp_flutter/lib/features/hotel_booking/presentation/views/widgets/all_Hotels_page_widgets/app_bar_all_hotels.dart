import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class AppBarAllHotel extends StatelessWidget {
  const AppBarAllHotel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllHotelsCubit, AllHotelStates>(
      builder: (context, state) {
        return SliverAppBar(
          elevation: 0,
          expandedHeight: 150,
          leading: const CustomBackButton(),
          flexibleSpace: (state is LoadingAllHotelStates)
              ? FlexibleSpaceBar(
                  background: Shimmer.fromColors(
                    period: const Duration(milliseconds: 2000),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[400]!,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                )
              : FlexibleSpaceBar(
                  background: Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/blurred-illuminated-wooden-hall_1203-1265.avif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 47, top: 16),
                      child: Text(
                        'Korea Hotels',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
