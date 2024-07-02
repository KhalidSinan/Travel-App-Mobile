import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/drop_select_class.dart';
<<<<<<< HEAD
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/form_destinations.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/list_destination_view.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/source_form.dart';
=======
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/form_destinations.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/list_destination_view.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/3_travel_destinations_widgets/source_form.dart';
>>>>>>> Hmzati

class TravelDestinationPageBody extends StatefulWidget {
  const TravelDestinationPageBody({super.key});

  @override
  State<TravelDestinationPageBody> createState() => _TravelDestinationPageBodyState();
}

class _TravelDestinationPageBodyState extends State<TravelDestinationPageBody> {
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
<<<<<<< HEAD
              SourceForm(searchcontroller1: searchcontroller1),
=======
              SourceForm(
                //searchcontroller1: searchcontroller1
              ),
>>>>>>> Hmzati
              const Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Class Type :',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(child: SizedBox(child: DropSelectClass())),
                  ],
                ),
              ),
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
<<<<<<< HEAD
                searchcontroller1: searchcontroller2,
                searchcontroller2: searchcontroller3,
=======
                // searchcontroller1: searchcontroller2,
                // searchcontroller2: searchcontroller3,
>>>>>>> Hmzati
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
