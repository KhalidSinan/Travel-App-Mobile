import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/form_cubit/form_cubit.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/views/widgets/custom_name_input.dart';

class FormCard extends StatefulWidget {
  // final String reservationType;
  final int index;
  final String classType;
  // final int seats;
  // final List<String>? flights;
  // final FormModel? formModel;
  // final bool isInitial;

  const FormCard({
    super.key,
    required this.index,
    required this.classType,
    // required this.formModel,
    // required this.flights,
    // required this.reservationType,
    // required this.seats,
    // required this.isInitial,
  });

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  String? name, fName, mName, lName, num;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  // List<PassengerModel> reservations = [];
  // Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Enter your name',
                  style: TextStyle(
                    color: Themes.third,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            CustomDataInput(
              text: 'First :',
              width: 0.6,
              inputType: TextInputType.name,
              onSaved: (value) {
                fName = value;
              },
            ),
            const SizedBox(height: 20),
            CustomDataInput(
              text: 'Middle :',
              width: 0.6,
              onSaved: (value) {
                mName = value;
              },
              inputType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            CustomDataInput(
              text: 'Last :',
              width: 0.6,
              onSaved: (value) {
                lName = value;
              },
              inputType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Enter passport number',
                  style: TextStyle(
                    color: Themes.third,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            CustomDataInput(
              width: 0.8,
              validator: validatePassportNumber,
              onSaved: (value) {
                num = value;
              },
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<FormCubit>(context)
                          .removePassenger(widget.index);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Themes.third,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        name = '$fName $mName $lName';
                        final data = {
                          "seat_class": widget.classType,
                          "person_name": name,
                          "person_passport": num,
                        };
                        BlocProvider.of<FormCubit>(context)
                            .addPassenger(widget.index, data);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Themes.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
