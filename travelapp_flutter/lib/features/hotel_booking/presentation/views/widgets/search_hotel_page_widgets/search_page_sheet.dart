import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_hotel_page_widgets/search_citys.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_hotel_page_widgets/search_dest.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_hotel_page_widgets/search_fields.dart';

class SearchPagenSheet extends StatelessWidget {
  const SearchPagenSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: BlocBuilder<AllHotelsCubit, AllHotelStates>(
        builder: (context, state) {
          List<dynamic> destination =
              BlocProvider.of<AllHotelsCubit>(context).destinations;
          if (state is LoadingAllHotelStates) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                const SearchFields(),
                // SizedBox(
                //   height: 200,
                //   child: ListView.builder(
                //     scrollDirection:Axis.horizontal,
                //     itemCount: destination.length,
                //     itemBuilder: (context, index) {
                //       return SearchDest(
                //         destination: destination[index].city,
                //         date: destination[index].date,
                //       );
                //     },
                //   ),
                // ),
                const SizedBox(height: 18),
                SearchCitys(),
              ],
            );
          }
        },
      ),
    );
  }
}
