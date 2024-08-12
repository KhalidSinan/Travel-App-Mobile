import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/group_trip_details_cubit/group_trip_details_cubit.dart';

class TripTypesList extends StatelessWidget {
  const TripTypesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final tripTypes =
        BlocProvider.of<GroupTripDetailsCubit>(context).groupTrip!.types;
    return Wrap(
      children: List.generate(tripTypes.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Chip(
            backgroundColor: Themes.primary.withOpacity(0.8),
            side: BorderSide.none,
            labelStyle: Styles.content.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            label: Text(tripTypes[index]),
          ),
        );
      }),
    );
  }
}
