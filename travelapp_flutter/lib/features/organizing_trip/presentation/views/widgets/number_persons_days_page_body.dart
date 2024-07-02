// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
<<<<<<< HEAD
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/2_date_selection.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/scroller.dart';

<<<<<<<< HEAD:travelapp_flutter/lib/features/organizing_trip/presentation/views/widgets/number_persons_days_page_body.dart
class NumberPersonsDaysPageBody extends StatelessWidget {
  const NumberPersonsDaysPageBody({super.key});
========
class PersonDaySelectionBody extends StatefulWidget {
  const PersonDaySelectionBody({super.key});
>>>>>>>> f9022ec8f06acb804a4fe167e758fe140e5ff259:travelapp_flutter/lib/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/persons_days_selection_body.dart

  @override
  State<PersonDaySelectionBody> createState() => _PersonDaySelectionBodyState();
}

class _PersonDaySelectionBodyState extends State<PersonDaySelectionBody> {
=======
import 'package:travelapp_flutter/core/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/2_date_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/scroller.dart';


class NumberPersonsDaysPageBody extends StatefulWidget {
  const NumberPersonsDaysPageBody({super.key});
  @override
  State<NumberPersonsDaysPageBody> createState() => _NumberPersonsDaysPageBodyState();
}

class _NumberPersonsDaysPageBodyState extends State<NumberPersonsDaysPageBody> {
>>>>>>> Hmzati
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
              'Let s create a fantastic trip !',
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
<<<<<<< HEAD
              Get.to(const DateSelection());
=======
              Get.to(const DateSelectionPage());
>>>>>>> Hmzati
            },
          )
        ],
      ),
    );
  }
}
