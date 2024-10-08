import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_hotel_page_widgets/search_citys.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_hotel_page_widgets/search_dest.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_hotel_page_widgets/search_fields.dart';

class SearchPageSheet extends StatefulWidget {
  const SearchPageSheet({super.key});

  @override
  State<SearchPageSheet> createState() => _SearchPageSheetState();
}

class _SearchPageSheetState extends State<SearchPageSheet> {
  @override
  void initState() {
    super.initState();
    getNextDestination();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: BlocBuilder<AllHotelsCubit, AllHotelStates>(
        builder: (context, state) {
          if (state is LoadingAllHotelStates) {
            return const CustomLoading();
          } else {
            bool? availableTrips = BlocProvider.of<AllHotelsCubit>(context)
                .destinations!
                .availableTrips;
            List<dynamic>? destination =
                BlocProvider.of<AllHotelsCubit>(context)
                    .destinations!
                    .nextDestinations!;
            return Column(
              children: [
                const SearchFields(),
                if (availableTrips == true)
                SearchDest(destination: destination),
                SearchCitys(),
              ],
            );
          }
        },
      ),
    );
  }

  Future<void> getNextDestination() async {
    await BlocProvider.of<AllHotelsCubit>(context).getNextDestination();
  }
}
