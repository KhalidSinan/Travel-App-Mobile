import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/repos/hotel_booking_impl_repo.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/review_hotel_cubit/make_hotel_reservation_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/review_hotel_cubit/make_hotel_reservation_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/custom_Stack.dart';

import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/row_builder.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/silver_list_builder.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  final double heightbackground = 200;

  final double heightCard = 220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            MakeHotelReservationCubit(getIt.get<HotelBookingImp>()),
        child:
            BlocConsumer<MakeHotelReservationCubit, MakeHotelReservationState>(
          listener: (context, state) {
            if (state is SuccessReviewHotelState) {
              // الانتقال الى واجهة الدفع
              //Get.to(page);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      CustomStack(
                          heightbackground: heightbackground,
                          heightCard: heightCard),
                      const RowBuilder(),
                      (state is FailureReviewHotelState)
                          ? SilverListBuilder(
                              notAvailableRoom: state.failure.errMessage,
                            )
                          : SilverListBuilder()
                    ],
                  ),
                ),
                (state is LoadingReviewHotelState)
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          onPressed: () async{
                            // String? startDate =
                            //     BlocProvider.of<MakeHotelReservationCubit>(
                            //             context)
                            //         .starDate;
                            // String? numOfDays =
                            //     BlocProvider.of<MakeHotelReservationCubit>(
                            //             context)
                            //         .numOfDays;
                                    
                            // await  BlocProvider.of<MakeHotelReservationCubit>(
                            //             context)
                            //         .makeHotelReservation(
                            //         hotelId: hotelId, 
                            //         roomCodes: ,
                            //          startDate: startDate!, 
                            //          numDays: numOfDays!);
                                    
                          },
                          label: 'Payement',
                          isFlat: true,
                        ))
              ],
            );
          },
        ),
      ),
    );
  }

  // void check ( ) async{
  //   await BlocProvider.of<MakeHotelReservationCubit>(context)!\.makeHotelReservation(
  //     hotelId: hotelId,
  //     roomCodes: roomCodes,
  //     startDate: startDate,
  //     numDays: numDays);

  // }
}
