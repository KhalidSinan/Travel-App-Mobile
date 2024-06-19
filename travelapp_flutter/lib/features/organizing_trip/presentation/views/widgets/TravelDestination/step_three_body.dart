import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/form_destinations.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/list_destination_view.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/source_form.dart';

class StepThreeBody extends StatefulWidget {
  const StepThreeBody({super.key});

  @override
  State<StepThreeBody> createState() => _StepThreeBodyState();
}

class _StepThreeBodyState extends State<StepThreeBody> {
  TextEditingController searchcontroller1 = TextEditingController();
  TextEditingController searchcontroller2 = TextEditingController();
  TextEditingController searchcontroller3 = TextEditingController();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Number Of Trip Days : ${8}',
                  style: Styles.heading2
                      .copyWith(color: Themes.third, fontSize: 25),
                ),
              ),
              SourceForm(searchcontroller1: searchcontroller1),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Destinations :',
                      style: TextStyle(fontSize: 25),
                    ),
                    const Spacer(),
                    const Text(
                      'Return Home',
                      style: TextStyle(fontSize: 15),
                    ),
                    Checkbox(
                        activeColor: Themes.primary,
                        value: value,
                        onChanged: (newvalue) {
                          setState(() {
                            // print(value);
                            value = newvalue!;
                          });
                        })
                  ],
                ),
              ),
              FormDestinations(
                searchcontroller1: searchcontroller2,
                searchcontroller2: searchcontroller3,
              ),
              const ListDestinationView(),
            ],
          ),
          SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {},
                label: "Check",
                isFlat: true,
              ))
        ],
      ),
    );
  }
}
