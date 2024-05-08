import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_sheet.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/airline_filter.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/price_filter.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/time_filter.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({
    super.key,
  });

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  @override
  Widget build(BuildContext context) {
    return CustomSheet(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PriceFilter(),
          const SizedBox(height: 16),
          const AirlineFilter(),
          const SizedBox(height: 16),
          const TimeFilter(),
          const Spacer(flex: 1),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: applyFilters,
              label: 'Apply Filters',
            ),
          ),
        ],
      ),
    );
  }

  Future<void> applyFilters() async {
    Get.back();
    final flightsCubit = BlocProvider.of<AllFlightsCubit>(context);
    if (flightsCubit.isTwoWay) {
      await flightsCubit.getAllTwoWayFlights(
        source: 'Venezuela',
        destination: 'Russia',
        date: '06/05/2024',
        seats: 1,
        seatsClass: 'A',
        dateEnd: '10/05/2024',
      );
    } else {
      await flightsCubit.getAllOneWayFlights(
        source: 'United States',
        destination: 'Russia',
        date: '09/05/2024',
        seats: 1,
        seatsClass: 'A',
      );
    }
  }
}
