import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/all_flights_header.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/days_row.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/flights_list.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/flights_pagination.dart';
import '../../../../../core/widgets/back_button.dart';

class AllFlightsPageBody extends StatelessWidget {
  const AllFlightsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            elevation: 0,
            expandedHeight: 135,
            leading: CustomBackButton(),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 56),
                  DaysRow(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Themes.secondary,
              thickness: 3,
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: AllFlightsHeader(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          const FlightsList(),
          const FlightsPagination()
        ],
      ),
    );
  }
}
