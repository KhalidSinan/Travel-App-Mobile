import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/filter_sheet.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/sort_sheet.dart';

class AllFlightsOptions extends StatelessWidget {
  const AllFlightsOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.bottomSheet(
              BlocProvider.value(
                value: BlocProvider.of<AllFlightsCubit>(context),
                child: const FilterSheet(),
              ),
            );
          },
          style: IconButton.styleFrom(),
          icon: Icon(
            FontAwesomeIcons.filter,
            color: Themes.third,
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            Get.bottomSheet(
              BlocProvider.value(
                value: BlocProvider.of<AllFlightsCubit>(context),
                child: const SortSheet(),
              ),
            );
          },
          icon: Icon(
            FontAwesomeIcons.sliders,
            color: Themes.third,
          ),
        ),
      ],
    );
  }
}
