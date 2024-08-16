import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/home/data/models/hotel_reservations_model.dart';
import 'package:travelapp_flutter/features/home/presentation/views/widgets/my_reservations_widgets/hotel_reservation_details.dart';

class HotelBox extends StatelessWidget {
  const HotelBox({super.key, required this.hotel});
  final HotelReservationsModel? hotel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => HotelReservationDetails(
              id: hotel!.id,
              name: hotel!.name,
              date: hotel!.date,
              days: hotel!.days.toString(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.grey[300]!, Colors.white],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                offset: Offset(-3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(FontAwesomeIcons.hotel, color: Themes.primary, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      hotel!.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.view_day_rounded,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'For ${hotel!.days} Days',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.hotel,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${hotel!.rooms} Rooms',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hotel!.date.substring(0, 10),
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '\$${hotel!.price}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
