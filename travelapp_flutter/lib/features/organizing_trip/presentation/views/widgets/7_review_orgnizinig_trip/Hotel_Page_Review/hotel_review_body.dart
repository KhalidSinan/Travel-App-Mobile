import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Hotel_Page_Review/hotel_card.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/7_review_orgnizinig_trip/Hotel_Page_Review/hotel_room_card.dart';

class HotelReviewBody extends StatelessWidget {
  const HotelReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final allHotels = BlocProvider.of<OrganizingTripCubit>(context).allHotels;
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: Themes.primary,
      ),
      itemCount: allHotels!.hotels.length,
      itemBuilder: (context, index) => ExpansionTile(
        title: HotelCardReview(hotel: allHotels.hotels[index]!),
        children: [
          SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allHotels.hotels[index]!.rooms.length,
                itemBuilder: (context, index) => RoomCardReview(
                      room: allHotels.hotels[index]!.rooms[index],
                    )),
          )
        ],
      ),
    );
  }
}
