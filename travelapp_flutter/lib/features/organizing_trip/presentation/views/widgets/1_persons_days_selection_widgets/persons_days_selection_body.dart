// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/2_date_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/scroller.dart';


class PersonDaySelectionBody extends StatefulWidget {
  const PersonDaySelectionBody({super.key});

  @override
  State<PersonDaySelectionBody> createState() => _PersonDaySelectionBodyState();
}

class _PersonDaySelectionBodyState extends State<PersonDaySelectionBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Let's create a fantastic trip !",
              style:
                  Styles.heading2.copyWith(color: Themes.third, fontSize: 25),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
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
                        select: 'p',
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
                        select: 'd',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.28),
          NextButton(
            onTap: () {
              Get.to(const DateSelectionPage());
            },
          )
        ],
      ),
    );
  }
}
