import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/back_button.dart';
import 'package:travelapp_flutter/core/widgets/failure_page.dart';
import 'package:travelapp_flutter/features/home/data/models/room_model.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_cubit.dart';
import 'package:travelapp_flutter/features/home/presentation/view_model/my_reservations_cubit/my_reservations_state.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/room_card.dart';

class HotelReservationDetails extends StatefulWidget {
  const HotelReservationDetails(
      {super.key,
      required this.id,
      required this.name,
      required this.date,
      required this.days});
  final String id, name, date, days;

  @override
  State<HotelReservationDetails> createState() =>
      _HotelReservationDetailsState();
}

class _HotelReservationDetailsState extends State<HotelReservationDetails> {
  @override
  void initState() {
    super.initState();
    getHotelDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: BlocConsumer<MyReservationsCubit, MyReservationsState>(
        listener: (context, state) {
          if (state is MyReservationsFailure) {
            Get.to(
              () => FailurePage(
                error: state.failure,
                onPressed: () {},
              ),
            );
          }
        },
        builder: (context, state) {
          List<RoomModel> rooms =
              BlocProvider.of<MyReservationsCubit>(context).rooms;
          if (state is MyReservationsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 26),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: Styles.heading2
                                  .copyWith(color: Colors.black, fontSize: 23),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.date.substring(0, 10),
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '${widget.days} Days',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ReservedRoomCard(room: rooms[index]),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  void getHotelDetails() async {
    await BlocProvider.of<MyReservationsCubit>(context)
        .getHotelReservationDetails(id: widget.id);
  }
}
