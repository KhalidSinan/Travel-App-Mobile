import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';

class AppBarAllHotel extends StatelessWidget {
  const AppBarAllHotel({
    super.key,
    required this.city,
  });
  final String city;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllHotelsCubit, AllHotelStates>(
      builder: (context, state) {
        return SliverAppBar(
          elevation: 0,
          expandedHeight: 150,
          leading: const CustomBackButton(color: Colors.white),
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
                            "assets/images/all hotels header.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 47, top: 16),
                      child: Text(
                        '$city Hotels',
                        style: const TextStyle(
                            fontSize: 20,
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
