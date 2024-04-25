import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "lib/core/utils/assets/reservation_ticket_images/f1.jpg",
            fit: BoxFit.fill,
            // height: 350,
          ),
        ],
      ),
    );
  }
}
