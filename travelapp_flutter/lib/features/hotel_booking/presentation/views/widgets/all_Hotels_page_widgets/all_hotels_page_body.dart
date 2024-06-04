import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/all_hotels_header.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/all_hotels_pagination.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/app_bar_all_hotels.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/all_Hotels_page_widgets/hotels_list.dart';

class AllHotelsPageBody extends StatelessWidget {
  const AllHotelsPageBody({
    super.key, required this.city,
  });
 final String city ;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        AppBarAllHotel(city: city),
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
