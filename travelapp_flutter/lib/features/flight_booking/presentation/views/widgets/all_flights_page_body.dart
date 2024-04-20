import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/all_flights_header.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/date_card.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/one_way_ticket.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/two_way_ticket.dart';

import '../../../../../core/widgets/back_button.dart';

class AllFlightsPageBody extends StatelessWidget {
  const AllFlightsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DateTime> days = [
      DateTime.now().subtract(const Duration(days: 1)),
      DateTime.now(),
      DateTime.now().add(const Duration(days: 1)),
    ];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            expandedHeight: 135,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      days.length,
                      (index) {
                        return DateCard(
                          date: days[index],
                          isCurrent: index == 1,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: Themes.secondary,
              thickness: 3,
              height: 60,
            ),
          ),
          const SliverToBoxAdapter(
            child: AllFlightsHeader(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: TwoWayTicket(),
              );
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
