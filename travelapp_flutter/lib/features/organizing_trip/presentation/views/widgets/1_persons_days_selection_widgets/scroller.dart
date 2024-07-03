

import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/scroll_item.dart';

class Scroller extends StatefulWidget {
  const Scroller(
      {super.key, required this.items, required this.onNumberOfPersonChanged});
  final int items;
  final Function(int) onNumberOfPersonChanged;
  @override
  State<Scroller> createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width * 0.62,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Column(
              children: [
                Divider(
                  indent: 20,
                  endIndent: 15,
                  color: Themes.primary,
                  thickness: 1.2,
                ),
                const SizedBox(height: 28),
                Divider(
                  indent: 20,
                  endIndent: 15,
                  color: Themes.primary,
                  thickness: 1.2,
                ),
              ],
            ),
          ),
          ListWheelScrollView.useDelegate(
            physics: const FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.5,
            itemExtent: widget.items.toDouble(),
            squeeze: 0.6,
            diameterRatio: 1.5,
            perspective: 0.008,
            onSelectedItemChanged: widget.onNumberOfPersonChanged,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: widget.items,
              builder: (context, index) {
                return ScrollItem(
                  num: index + 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
