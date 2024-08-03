import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';

class OrganizedTripPagination extends StatelessWidget {
  const OrganizedTripPagination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizedGroupCubit, OrganizedGroupCubitState>(
      builder: (context, state) {
        if (state is SuccessOrganizedGroupTripState) {
          int totalTrips = BlocProvider.of<OrganizedGroupCubit>(context)
              .allOrganizedGroupTrip
              .length;
          int numberPages = (totalTrips / 10).ceil();
          if (numberPages <= 1) {
            return const SizedBox();
          }
          return NumberPaginator(
            numberPages: numberPages,
            initialPage: BlocProvider.of<OrganizedGroupCubit>(context).page - 1,
            onPageChange: (index) async {
              await BlocProvider.of<OrganizedGroupCubit>(context)
                  .changPage(index + 1);
            },
            config: NumberPaginatorUIConfig(
              buttonSelectedBackgroundColor: Themes.primary,
              buttonUnselectedForegroundColor: Themes.third,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
