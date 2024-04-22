import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/all_flights_header.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/days_row.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/two_way_ticket.dart';
import '../../../../../core/widgets/back_button.dart';

class AllFlightsPageBody extends StatefulWidget {
  const AllFlightsPageBody({
    super.key,
  });

  @override
  State<AllFlightsPageBody> createState() => _AllFlightsPageBodyState();
}

class _AllFlightsPageBodyState extends State<AllFlightsPageBody> {
  late NumberPaginatorController _controller;
  @override
  void initState() {
    super.initState();
    _controller = NumberPaginatorController();
  }

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
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(),
                  SizedBox(height: 8),
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
          SliverList.builder(
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: TwoWayTicket(),
              );
            },
            itemCount: 10,
          ),
          SliverToBoxAdapter(
            child: NumberPaginator(
              controller: _controller,
              numberPages: 10,
              onPageChange: (index) {
                _controller.navigateToPage(index);
                setState(() {});
              },
              config: NumberPaginatorUIConfig(
                buttonSelectedBackgroundColor: Themes.primary,
                buttonUnselectedForegroundColor: Themes.third,
              ),
            ),
          )
        ],
      ),
    );
  }
}
