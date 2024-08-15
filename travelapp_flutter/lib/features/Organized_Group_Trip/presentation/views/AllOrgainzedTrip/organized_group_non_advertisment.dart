import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/models/all_trip_organized_model.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';

class OrganizedGroupNonAdvertisment extends StatelessWidget {
  const OrganizedGroupNonAdvertisment({super.key, required this.oneTrip});

  final AllOrganizedGroupTrip? oneTrip;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizedGroupCubit, OrganizedGroupCubitState>(
      builder: (context, state) {
        final screenWidth = MediaQuery.of(context).size.width;
        final containerHeight = oneTrip?.isAnnounced ?? false ? 380.0 : 380.0;
        final padding = screenWidth * 0.02;
        final isLargeScreen = screenWidth > 600;

        return Stack(
          children: [
            Container(
              width: screenWidth * 0.9,
              height: containerHeight,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216),
                border: Border.all(
                    color: oneTrip!.isAnnounced ? Themes.third : Colors.grey,
                    width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: oneTrip!.isAnnounced ? padding : padding / 2),
                  Text(
                    "Organizer ${oneTrip!.organizerName}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: isLargeScreen ? 18 : 16,
                    ),
                  ),
                  SizedBox(height: padding),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.planeDeparture,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      SizedBox(width: padding),
                      Flexible(
                        child: Text(
                          oneTrip!.source,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLargeScreen ? 18 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: padding),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.planeArrival,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      SizedBox(width: padding),
                      Flexible(
                        child: Text(
                          '${oneTrip!.destinations[0]}-${oneTrip!.destinations[1]}',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLargeScreen ? 18 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: padding),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Types: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLargeScreen ? 18 : 16,
                          ),
                        ),
                        TextSpan(
                          text: type(oneTrip!.tripType),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLargeScreen ? 18 : 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: padding),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.person,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      Text(
                        ' : ${oneTrip!.numOfParticipating}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isLargeScreen ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: padding),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        color: Themes.primary,
                        size: isLargeScreen ? 20 : 16,
                      ),
                      Text(
                        " ${oneTrip!.date}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isLargeScreen ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: padding),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.dollarSign,
                        color: Themes.primary,
                        size: isLargeScreen ? 18 : 16,
                      ),
                      Text(
                        oneTrip!.price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isLargeScreen ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: padding),
                ],
              ),
            ),
            if (oneTrip!.isAmostComplete)
              Positioned(
                top: -10,
                right: -10,
                child: Container(
                  width: isLargeScreen ? 50 : 40,
                  height: isLargeScreen ? 50 : 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 2),
                  ),
                  child: Lottie.asset('assets/animations/time.json'),
                ),
              ),
          ],
        );
      },
    );
  }
}

String type(List<String> types) {
  return types.join('-');
}
