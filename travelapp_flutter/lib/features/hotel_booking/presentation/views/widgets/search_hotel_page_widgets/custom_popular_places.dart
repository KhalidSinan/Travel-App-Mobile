import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';

class PopularCitys extends StatelessWidget {
  const PopularCitys({super.key, required this.image, required this.city});
  final String image;
  final String city;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await BlocProvider.of<AllHotelsCubit>(context)
            .getAllHotelData(nameHotelOrCity: city);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 130,
              width: 130,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                city,
                style: TextStyle(fontSize: 17, color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
