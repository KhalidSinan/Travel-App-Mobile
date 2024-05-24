import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/core/helpers/date_picker.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';

class SearchFields extends StatefulWidget {
  const SearchFields({super.key});

  @override
  State<SearchFields> createState() => _SearchFieldsState();
}

class _SearchFieldsState extends State<SearchFields> {
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Look for a hotel',
            style: Styles.heading2,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            textInputType: TextInputType.text,
            hintText: 'Search by a hotel name or a city',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Reservation date',
            prefixIcon: Icon(
              Icons.calendar_month,
              color: Colors.grey[600],
            ),
            controller: date,
            onTap: () async {
              DateTime? pickeddate = await customDatePicker(context: context);
              if (pickeddate != null) {
                setState(
                  () {
                    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
                    date.text = outputFormat.format(pickeddate);
                  },
                );
              }
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                child: CustomTextFormField(
                  textInputType: TextInputType.number,
                  readOnly: false,
                  hintText: 'Days',
                  prefixIcon: Icon(
                    Icons.view_day_outlined,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.43,
                child: CustomTextFormField(
                  readOnly: false,
                  textInputType: TextInputType.number,
                  hintText: 'Rooms',
                  prefixIcon: Icon(
                    Icons.meeting_room,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {},
              label: 'Check',
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
