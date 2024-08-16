import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/snack_bar.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_loading.dart';
import 'package:travelapp_flutter/features/hotel_booking/data/models/room_cart_model.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_states.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/custom_Stack.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/row_builder.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/silver_list_builder.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({
    super.key,
    required this.bloc,
  });
  final HotelDetailsCubit bloc;
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final double heightbackground = 200;

  final double heightCard = 220;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider.value(
        value: widget.bloc,
        child: Scaffold(
          body: BlocConsumer<HotelDetailsCubit, HotelDetailsStates>(
            listener: (context, state) {
              if (state is SuccessReviewHotelState) {
                print('success');
                // Get.to(() => PayPal(
                //       onSuccess: () {},
                //       url:
                //           "https://7157-185-183-34-167.ngrok-free.app/hotels/reservation/665ed1a19af76a7120c1dfbc/pay",
                //     ));
                Get.until((route) => route.settings.name == 'hotelsSearch');
                Get.back();
              }
              if (state is FailureReviewHotelState) {
                showCustomSnackBar(
                  title: state.failure.errTitle!,
                  message: state.failure.errMessage,
                );
              }
              if (state is RoomsFailureReviewHotelState) {
                setState(() {});
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
                          heightCard: heightCard,
                        ),
                        const RowBuilder(),
                        const SilverListBuilder()
                      ],
                    ),
                  ),
                  (state is LoadingReviewHotelState)
                      ? const CustomLoading()
                      : SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            onPressed: checkReservation,
                            label:
                                'Check Reservation (\$${BlocProvider.of<HotelDetailsCubit>(context).getTotalPrice()})',
                            isFlat: true,
                          ),
                        )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void checkReservation() async {
    String? startDate = widget.bloc.startDate;
    String? numOfDays = widget.bloc.numDays;
    print(startDate);
    List<String> formattedDate = startDate!.split('/');
    startDate = "${formattedDate[2]}-${formattedDate[1]}-${formattedDate[0]}";
    List<RoomCartModel>? rooms = widget.bloc.selectedRooms;

    List<Map<String, dynamic>> roomCodes = [];

    for (var room in rooms) {
      Map<String, dynamic> oneRoom = {
        "code": room.room.code,
        "count": room.count,
      };
      roomCodes.add(oneRoom);
    }
    await widget.bloc.makeHotelReservation(
      roomCodes: roomCodes,
      startDate: startDate,
      numDays: numOfDays!,
    );
  }
}
