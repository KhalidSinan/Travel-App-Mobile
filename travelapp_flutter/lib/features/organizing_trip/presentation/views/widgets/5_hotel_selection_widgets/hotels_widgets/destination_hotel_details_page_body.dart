import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/auth/presentation/views/widgets/image_slider.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/hotel_description.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/hotel_details_page_widgets/stars_list.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/rooms_selection_page.dart';

class HotelSelectionDetailsPageBody extends StatelessWidget {
  const HotelSelectionDetailsPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    final hotelRes = BlocProvider.of<HotelReservationCubit>(context);
    final hotel = hotelRes.currentHotel;
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
              leading: getBackButton(),
              flexibleSpace: FlexibleSpaceBar(
                background: ImageSlider(
                  images: hotel!.images,
                  network: true,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList.list(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name,
                        style: Styles.heading,
                      ),
                      StarsList(
                        stars: hotel.stars,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationDot,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            hotel.location.country!,
                            style: Styles.content.copyWith(
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(children: [
                        Text(
                          "${hotel.location.city} - ${hotel.location.name}",
                          style: Styles.content.copyWith(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                      ])
                    ],
                  ),
                  const SizedBox(height: 24),
                  // hotel description
                  HotelDescription(description: hotel.description),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomButton(
            onPressed: () {
              // Get.to(
              //   () => RoomsSelectionPage(
              //     bloc: hotelRes,
              //     bloc2: BlocProvider.of<HotelInformationCubit>(context),
              //   ),
              // );
              BlocProvider.of<HotelReservationCubit>(context).onNext();
            },
            label: "Select Room(s)",
            isFlat: true,
          ),
        ),
      ],
    );
  }

  Container getBackButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(150),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(radius)),
      ),
      child: const CustomBackButton(color: Colors.white),
    );
  }
}
