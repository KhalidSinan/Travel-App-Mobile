import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/next_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/data/repos/organized_group_repo_impl.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/info_organized_group_trip_page_widgets/select_type_trip.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/info_organized_group_trip_page_widgets/trip_type_chip.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_text_and_text_form.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/trip_payment_page.dart';

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
  List<String> selectedTypes = [];
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Expanded(
              child: ListView(
                children: [
                  Text(
                    'enter more info about your trip :',
                    style: Styles.content,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SelectTypeTrip(
                    text: 'Select Type(s) of Trip :',
                    onAddType: (type) {
                      selectedTypes.removeWhere((ty) => type == ty);
                      selectedTypes.add(type);
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    runSpacing: 8,
                    children: [
                      ...List.generate(selectedTypes.length, (index) {
                        return GestureDetector(
                          onDoubleTap: () {
                            selectedTypes.removeWhere(
                                (type) => type == selectedTypes[index]);
                            setState(() {});
                          },
                          child: TripTypeChip(type: selectedTypes[index]),
                        );
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextAndTextForm(
                    text: 'enter your profit percentage for each person :',
                    hintText: 'enter your profit',
                    prefixIcon: const Icon(FontAwesomeIcons.dollarSign),
                    validator: validateName,
                    hight: 85,
                    textInputType: TextInputType.number,
                    onSaved: (val) => profit = val,
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
                    maxLines: 3,
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
      BlocProvider.of<OrganizingTripCubit>(context).setTripInfo(
        types: selectedTypes,
        profit: profit!,
        desc: desc!,
      );
      Get.to(() => TripPaymentPage(
            seats: BlocProvider.of<OrganizingTripCubit>(context).numberPerson!,
            trip: BlocProvider.of<OrganizingTripCubit>(context),
            groupTrip: true,
          ));
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
