import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/ticket_booking/presentation/views/widgets/date_card.dart';
import 'package:travelapp_flutter/features/ticket_booking/presentation/views/widgets/one_way_ticket.dart';

import '../../../../../core/widgets/back_button.dart';

class AllFlightsPageBody extends StatelessWidget {
  const AllFlightsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> weekDays = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            // backgroundColor: const Color(0xfff2f4f3)
            expandedHeight: 125,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: List.generate(
                        30,
                        (index) {
                          return DateCard(
                            dayNumber: index,
                            weekDays: weekDays,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 30),
          SliverToBoxAdapter(
            child: Divider(
              color: Themes.secondary,
              thickness: 3,
              height: 60,
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'All Flights',
                      style: Styles.heading,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '(14)',
                      style: Styles.subtitle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(),
                      icon: Icon(
                        FontAwesomeIcons.filter,
                        color: Colors.blue[200],
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.sliders,
                        color: Colors.blue[200],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          // tickets
          SliverList.builder(
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: OneWayTicket(),
              );
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
