import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/core/helpers/date_picker.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';

class DateFiltering extends StatefulWidget {
  const DateFiltering({super.key});

  @override
  State<DateFiltering> createState() => _DateFilteringState();
}

class _DateFilteringState extends State<DateFiltering> {
  TextEditingController dateController = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  String? date;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CustomTextFormField(
            hintText: 'Select Start Date',
            outlineInputBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Themes.primary),
                borderRadius: BorderRadius.circular(15)),
            prefixIcon: Icon(
              Icons.calendar_month,
              color: Colors.grey[600],
            ),
            controller: dateController,
            onSaved: (value) {
              date = value;
            },
            onTap: () async {
              DateTime? pickeddate = await customDatePicker(context: context);
              if (pickeddate != null) {
                setState(
                  () {
                    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
                    dateController.text = outputFormat.format(pickeddate);

                    //print(BlocProvider.of<AllHotelsCubit>(context).startDate);
                  },
                );
              }
            }),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'Select End Date',
            outlineInputBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Themes.primary),
                borderRadius: BorderRadius.circular(15)),
            prefixIcon: Icon(
              Icons.calendar_month,
              color: Colors.grey[600],
            ),
            controller: dateController2,
            onSaved: (value) {
              date = value;
            },
            onTap: () async {
              DateTime? pickeddate = await customDatePicker(context: context);
              if (pickeddate != null) {
                setState(
                  () {
                    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
                    dateController2.text = outputFormat.format(pickeddate);

                    //print(BlocProvider.of<AllHotelsCubit>(context).startDate);
                  },
                );
              }
            }),
      ]),
    );
  }
}
