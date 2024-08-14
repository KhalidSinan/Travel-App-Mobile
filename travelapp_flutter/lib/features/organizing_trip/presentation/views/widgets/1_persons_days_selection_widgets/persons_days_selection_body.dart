import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/2_date_selection_page.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/1_persons_days_selection_widgets/scroller.dart';

class PersonsDaysSelectionBody extends StatefulWidget {
  const PersonsDaysSelectionBody({
    super.key,
  });

  @override
  State<PersonsDaysSelectionBody> createState() =>
      _PersonsDaysSelectionBodyState();
}

class _PersonsDaysSelectionBodyState extends State<PersonsDaysSelectionBody> {
  int numberOfPerson = 1;
  int numberDays = 1;
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
              "Let's create a fantastic trip !",
              style:
                  Styles.heading2.copyWith(color: Themes.third, fontSize: 25),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Persons',
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(width: 10),
                      Scroller(
                        items: 30,
                        onNumberOfPersonChanged: (int person) {
                          setState(() {
                            numberOfPerson = person + 1;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 65),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Days',
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(width: 10),
                      Scroller(
                        items: 30,
                        onNumberOfPersonChanged: (p0) {
                          setState(() {
                            numberDays = p0 + 1;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          NextButton(onTap: () {
            BlocProvider.of<OrganizingTripCubit>(context)
                .setNumberPerson(numberOfPerson);
            BlocProvider.of<OrganizingTripCubit>(context)
                .setNumberDays(numberDays);

            // Get.to(() => const DateSelection());
            BlocProvider.of<OrganizingTripCubit>(context).onNext();
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
