import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class DetsailsHeader extends StatelessWidget {
  const DetsailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.airline_seat_recline_extra,
                  size: 32,
                  color: Themes.primary,
                  applyTextScaling: true,
                ),
                Text(
                  ": 10",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Themes.primary,
                  ),
                )
              ],
            ),
            Text(
              "Economy",
              style: TextStyle(
                  fontSize: 18,
                  color: Themes.primary,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}



//  RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   WidgetSpan(
//                       child: Icon(
//                     Icons.airline_seat_recline_extra,
//                     size: 33,
//                     color: Themes.primary,
//                   )),
//                   TextSpan(
//                     text: ' : 5 ',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Themes.primary,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ],
//               ),
//             ),