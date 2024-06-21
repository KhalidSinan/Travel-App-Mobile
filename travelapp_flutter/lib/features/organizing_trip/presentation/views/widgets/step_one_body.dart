import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/scroller.dart';

class StepOneBody extends StatelessWidget {
  const StepOneBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Let s create a fantastic trip !',
              style:
                  Styles.heading2.copyWith(color: Themes.third, fontSize: 25),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Persons',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(width: 10),
                      Scroller(
                        items: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 65),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Days',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(width: 10),
                      Scroller(
                        items: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.28),
          NextButton(onTap: () {})
        ],
      ),
    );
  }
}
