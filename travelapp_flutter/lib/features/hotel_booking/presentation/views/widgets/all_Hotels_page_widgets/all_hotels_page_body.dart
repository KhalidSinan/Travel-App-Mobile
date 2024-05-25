import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/all_hotels_header.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/all_hotels_pagination.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/hotels_list.dart';

class AllHotelsPageBody extends StatelessWidget {
  const AllHotelsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 0,
          expandedHeight: 150,
          leading: const CustomBackButton(),
          flexibleSpace: FlexibleSpaceBar(
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
        ),
        SliverToBoxAdapter(
          child: Divider(
            color: Themes.secondary,
            thickness: 3,
            height: 20,
          ),
        ),
        const SliverToBoxAdapter(
          child: AllHotelsHeader(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        const HotelsList(),
        const HotelsPagination()
      ],
    );
  }
}
