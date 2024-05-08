import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/clender_row.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_search.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/drop_select_class.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/number_of_passengers.dart';

class TwoViewBar extends StatefulWidget {
  const TwoViewBar({super.key});

  @override
  State<TwoViewBar> createState() => _TwoViewBarState();
}

class _TwoViewBarState extends State<TwoViewBar> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController searchcontroller1 = TextEditingController();
  TextEditingController searchcontroller2 = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? src, des, depart, retur, numOfPassengers;

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
                  validator: validateName,
                  onTap: searchFunction1,
                  controller: searchcontroller1,
                  onSaved: (value) => src = value,
                ),
                CustomTextAndTextForm(
                  text: 'To',
                  prefixIcon: const Icon(
                    Icons.flight_land_outlined,
                  ),
                  hintText: 'Select Des',
                  validator: validateName,
                  controller: searchcontroller2,
                  onTap: searchFunction2,
                  onSaved: (value) => des = value,
                ),
                Row(
                  children: [
                    ClenderRow(
                      text: 'Depart',
                      width: 170,
                      onSaved: (value) => depart = value,
                    ),
                    ClenderRow(
                      text: 'return',
                      width: 170,
                      onSaved: (value) => retur = value,
                    )
                  ],
                ),
                Row(
                  children: [
                    NumberOfPassengers(
                      onSaved: (value) => numOfPassengers = value,
                    ),
                    const DropSelectClass(),
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
