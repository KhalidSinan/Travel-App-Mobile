import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/hotel_details_cubit/hotel_details_cubit.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/views/widgets/review_hotel_page_widgets/delete_page.dart';

class RowBuilder extends StatelessWidget {
  const RowBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, right: 8, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Rooms :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            IconButton(
              style: const ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.red),
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                Get.to(DeletePage(
                  bloc: BlocProvider.of<HotelDetailsCubit>(context),
                ));
              },
              icon: const Icon(
                Icons.delete_forever,
                size: 32,
              ),
            ),
            // Button OR Text ................
            // Text(
            //   'Remove room',
            //   style: TextStyle(color: Colors.red),
            // )
          ],
        ),
      ),
    );
  }
}
