import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/clender_row.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_search.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/drop_select_class.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/number_of_passengers.dart';

class OneViewBar extends StatefulWidget {
  const OneViewBar({super.key});

  @override
  State<OneViewBar> createState() => _OneViewBarState();
}

class _OneViewBarState extends State<OneViewBar> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController searchcontroller1 = TextEditingController();
  TextEditingController searchcontroller2 = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? src, des, depart, numOfPassengers;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CustomTextAndTextForm(
                  text: 'From',
                  prefixIcon: const Icon(Icons.flight_takeoff_outlined),
                  hintText: 'Select Src',
                  onTap: searchFunction1,
                  controller: searchcontroller1,
                  onSaved: (value) => src = value,
                  validator: validateName,
                ),
                CustomTextAndTextForm(
                  text: 'To',
                  prefixIcon: const Icon(
                    Icons.flight_land_outlined,
                  ),
                  hintText: 'Select Des',
                  controller: searchcontroller2,
                  onTap: searchFunction2,
                  onSaved: (value) => des = value,
                  validator: validateName,
                ),
                ClenderRow(
                  text: 'Depart',
                  width: 360,
                  onSaved: (vlaue) => depart = vlaue,
                ),
                Row(
                  children: [
                    NumberOfPassengers(
                      onSaved: (value) => numOfPassengers = value,
                    ),
                    const DropSelectClass()
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                        width: 350,
                        child: CustomButton(
                            onPressed: searchFlight, label: 'Search Flights')))
              ],
            ),
          ),
        ));
  }

  void searchFlight() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }

  void searchFunction1() async {
    var searchResult =
        await showSearch(context: context, delegate: CustomSearch());
    if (searchResult != null) {
      setState(() {
        searchcontroller1.text = searchResult.toString();
      });
    }
  }

  void searchFunction2() async {
    var searchResult =
        await showSearch(context: context, delegate: CustomSearch());
    if (searchResult != null) {
      setState(() {
        searchcontroller2.text = searchResult.toString();
      });
    }
  }
}
