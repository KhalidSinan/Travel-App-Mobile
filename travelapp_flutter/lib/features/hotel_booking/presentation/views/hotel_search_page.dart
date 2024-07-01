import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/all_hotel_page.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/search_hotel_page_widgets/search_hotel_page_body.dart';

class HotelSearchPage extends StatelessWidget {
  const HotelSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllHotelsCubit(getIt.get<HotelBookingImp>()),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<AllHotelsCubit, AllHotelStates>(
            listener: (context, state) {
              if (state is FailureGetAllHotelsState) {
                Get.to(
                  () => FailurePage(
                    error: state.failure,
                    onPressed: () {},
                  ),
                );
              }
              if (state is SuccessAllHotelStates) {
                Get.to(
                  () => BlocProvider.value(
                    value: BlocProvider.of<AllHotelsCubit>(context),
                    child: const AllHotelsPage(),
                  ),
                );
              }
            },
            child: const HotelSearchPageBody(),
          ),
        ),
      ),
    );
  }
}
// void searchFunction() async {
//     var searchResult = await showSearch(
//         context: context,
//         delegate: CitiesSearch(
//             countries:
//                 BlocProvider.of<OrganizingTripCubit>(context).countries!));
//     if (searchResult != null) {
//       setState(() {
//         searchController.text = searchResult.toString();
//       });
//     }
//   }