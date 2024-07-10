import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip_states.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/Destination_Filter/destinations_filter_page.dart';

class ListDestinationView extends StatelessWidget {
  const ListDestinationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizingTripCubit, OrganizingTripStates>(
      builder: (context, state) {
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: BlocProvider.of<OrganizingTripCubit>(context)
                .destinations
                .length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Destination ${index + 1} : ${BlocProvider.of<OrganizingTripCubit>(context).destinations[index].city}",
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NumberDays : ${BlocProvider.of<OrganizingTripCubit>(context).destinations[index].days}",
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                iconSize: 23,
                                onPressed: () {
                                  BlocProvider.of<OrganizingTripCubit>(context)
                                      .deleteDestination(index);
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.redAccent,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.to(DestinaionsFilterPage(
                                    index: index,
                                  ));
                                },
                                icon: Icon(
                                  FontAwesomeIcons.chevronRight,
                                  color: Themes.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
