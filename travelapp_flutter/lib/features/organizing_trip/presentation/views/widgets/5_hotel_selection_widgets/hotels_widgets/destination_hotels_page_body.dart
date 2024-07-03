import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/hotel_reservation_cubit/hotel_reservations_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/hotel_selection_pagination.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/5_hotel_selection_widgets/hotels_widgets/hotels_selection_list.dart';

class DestinationHotelsPageBody extends StatelessWidget {
  const DestinationHotelsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: const CustomBackButton(),
          title: Text(
            BlocProvider.of<HotelReservationCubit>(context).city,
            style: Styles.heading2,
          ),
        ),
        BlocBuilder<HotelReservationCubit, HotelReservationState>(
          builder: (context, state) {
            if (state is HotelReservationLoadingState) {
              return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()));
            } else if (state is NoHotelsState) {
              return const SliverToBoxAdapter(child: Text('No hotels found'));
            } else {
              return const HotelSelectionList();
            }
          },
        ),
        BlocBuilder<HotelReservationCubit, HotelReservationState>(
          builder: (context, state) {
            if (state is HotelReservationSuccessState) {
              return const HotelSelectionPagination();
            } else {
              return const SliverToBoxAdapter(child: SizedBox());
            }
          },
        )
      ],
    );
  }
}
