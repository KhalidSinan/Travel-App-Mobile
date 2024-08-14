import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_information_cubit/hotel_information_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservations_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/destination_hotel_details_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/hotel_review_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/rooms_selection_page.dart';

class HotelInformationPage extends StatefulWidget {
  const HotelInformationPage({
    super.key,
    required this.bloc,
    required this.bloc2,
  });
  final HotelReservationCubit bloc;
  final HotelInformationCubit bloc2;
  @override
  State<HotelInformationPage> createState() => _HotelInformationPageState();
}

class _HotelInformationPageState extends State<HotelInformationPage> {
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: widget.bloc),
          BlocProvider.value(value: widget.bloc2)
        ],
        child: BlocListener<HotelReservationCubit, HotelReservationState>(
          listener: (context, state) {
            if (state is NextPageState) {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else if (state is PreviousPageState) {
              controller.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            }
          },
          child: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HotelSelectionDetailsPage(),
              RoomsSelectionPage(),
              HotelReviewPage(),
            ],
          ),
        ));
  }
}
