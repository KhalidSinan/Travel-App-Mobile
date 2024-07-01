import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/4_tickets_review_widgets/tickets_row.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';

class TicketsReviewBody extends StatefulWidget {
  const TicketsReviewBody({super.key, required this.state});
  final String state;
  @override
  State<TicketsReviewBody> createState() => _TicketsReviewBodyState();
}

class _TicketsReviewBodyState extends State<TicketsReviewBody> {
  @override
  Widget build(BuildContext context) {
    int count = 4;
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: count,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TicketsRow(
                      state: widget.state,
                    ),
                    if (widget.state == 'yes')
                      Column(
                        children: [
                          if (index == count - 1)
                            SizedBox(
                                height: count == 1
                                    ? MediaQuery.of(context).size.height * 0.56
                                    : count == 2
                                        ? MediaQuery.of(context).size.height *
                                            0.305
                                        : count == 3
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05
                                            : 0),
                          if (index == count - 1)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: NextButton(onTap: () {}),
                            )
                        ],
                      )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
