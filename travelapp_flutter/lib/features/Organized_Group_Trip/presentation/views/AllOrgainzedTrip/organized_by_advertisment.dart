import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';

class OrganizedByAdvertisment extends StatelessWidget {
  const OrganizedByAdvertisment({
    super.key,
    required this.oneTrip,
  });

  final AllOrganizedGroupTrip? oneTrip;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizedGroupCubit, OrganizedGroupCubitState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            // final isLargeScreen = width > 600;

            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 216, 216),
                    border: Border.all(
                      color: oneTrip!.isAnnounced ? Colors.red : Themes.third,
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: oneTrip!.isAnnounced ? 17 : 8),
                      Text(
                        "Organizer ${oneTrip!.organizerName}",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.planeDeparture,
                            color: Themes.primary,
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            child: Text(
                              oneTrip!.source,
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.planeArrival,
                            color: Themes.primary,
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            child: Text(
                              '${oneTrip!.destinations[0]}-${oneTrip!.destinations[1]}',
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Types: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: '${oneTrip!.tripType[0]}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.person,
                            color: Themes.primary,
                          ),
                          Text(
                            ' : ${oneTrip!.numOfParticipating}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.calendar,
                            color: Themes.primary,
                          ),
                          Text(
                            oneTrip!.date,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.dollarSign,
                            color: Themes.primary,
                          ),
                          Text(
                            oneTrip!.price.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 26),
                    ],
                  ),
                ),
                // if (oneTrip!.isAmostComplete)
                //   Positioned(
                //     top: -10,
                //     right: -10,
                //     child: Container(
                //       width: isLargeScreen ? 50 : 40,
                //       height: isLargeScreen ? 50 : 40,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         shape: BoxShape.circle,
                //         border: Border.all(color: Colors.red, width: 2),
                //       ),
                //       child: Lottie.asset('assets/animations/time.json'),
                //     ),
                //   ),
              ],
            );
          },
        );
      },
    );
  }
}
