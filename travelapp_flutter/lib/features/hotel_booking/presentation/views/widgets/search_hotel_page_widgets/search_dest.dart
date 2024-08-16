import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp_flutter/features/hotel_booking/presentation/view_model/all_hotel_cubit/all_hotel_cubit.dart';

class SearchDest extends StatelessWidget {
  const SearchDest({
    super.key,
    required this.destination,
  });

  final List<dynamic> destination;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            'You already have a trip to',
            style: GoogleFonts.quattrocento().copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Themes.third,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destination.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  if (index == 0) const SizedBox(width: 24),
                  GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<AllHotelsCubit>(context)
                          .getAllHotelData(
                        nameHotelOrCity: destination[index].city,
                        startDate: destination[index].date,
                      );
                    },
                    child: Container(
                      margin: destination.length == 1
                          ? const EdgeInsets.only(right: 24)
                          : const EdgeInsets.only(right: 10),
                      width: destination.length == 1
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        shadowColor: Themes.primary,
                        color: Colors.white,
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      destination[index].city,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.calendarDay,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    destination[index].date,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
