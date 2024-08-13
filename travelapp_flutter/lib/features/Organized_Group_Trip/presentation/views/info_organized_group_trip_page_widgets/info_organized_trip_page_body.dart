import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/info_organized_group_trip_page_widgets/select_type_trip.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';

class InfoOrganizedGroupTripPageBody extends StatefulWidget {
  const InfoOrganizedGroupTripPageBody({super.key});

  @override
  State<InfoOrganizedGroupTripPageBody> createState() =>
      _InfoOrganizedGroupTripPageBodyState();
}

class _InfoOrganizedGroupTripPageBodyState
    extends State<InfoOrganizedGroupTripPageBody> {
  String? desc, profit;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      child: Column(
        children: [
          Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Expanded(
              child: ListView(
                children: [
                  Text(
                    'enter more info a bout your trip :',
                    style: Styles.content,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SelectTypeTrip(
                    text: 'Select Type of Trip :',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextAndTextForm(
                    text: 'enter your profit percentage for each person :',
                    hintText: 'enter your profit',
                    validator: validateName,
                    hight: 85,
                    textInputType: TextInputType.number,
                    onSaved: (val) => profit = val,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // color: Themes.secondary,
                    child: const Text(
                      '* Our app has a profit percentage from this amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextAndTextForm(
                    text: 'Descriotion The Trip :',
                    hintText: 'enter the desc ',
                    minLines: 1,
                    maxLines: 100,
                    hight: 200,
                    validator: validateName,
                    onSaved: (val) => desc = val,
                  ),
                ],
              ),
            ),
          ),
          NextButton(onTap: nextButton)
        ],
      ),
    );
  }

  void nextButton() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
       autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
