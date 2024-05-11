import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
<<<<<<< HEAD
=======
import 'package:travelapp_flutter/core/utils/assets.dart';
>>>>>>> Khalid

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
<<<<<<< HEAD
            "lib/core/utils/assets/reservation_ticket_images/f1.jpg",
=======
            Assets.nature1,
>>>>>>> Khalid
            fit: BoxFit.fill,
            // height: 350,
          ),
        ],
      ),
    );
  }
}
