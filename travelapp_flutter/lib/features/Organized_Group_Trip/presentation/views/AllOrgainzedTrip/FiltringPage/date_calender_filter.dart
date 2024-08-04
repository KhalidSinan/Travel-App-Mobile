import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travelapp_flutter/core/helpers/date_picker.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';

class DateFiltering extends StatefulWidget {
  const DateFiltering({super.key});

  @override
  State<DateFiltering> createState() => _DateFilteringState();
}

class _DateFilteringState extends State<DateFiltering> {
  TextEditingController dateController = TextEditingController();
  TextEditingController dateController2 = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  String? errorText;

  @override
  void initState() {
    super.initState();
    var cubit = BlocProvider.of<OrganizedGroupCubit>(context);
    dateController.text = cubit.startDate ?? "Select Start Date";
    dateController2.text = cubit.endDate ?? "Select End Date";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizedGroupCubit, OrganizedGroupCubitState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFormField(
              hintText: dateController.text,
              outlineInputBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Themes.primary),
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: Icon(
                Icons.calendar_month,
                color: Colors.grey[600],
              ),
              controller: dateController,
              onSaved: (value) {
                BlocProvider.of<OrganizedGroupCubit>(context).startDate = value;
              },
              onTap: () async {
                DateTime? pickedDate = await customDatePicker(context: context);
                if (pickedDate != null) {
                  setState(() {
                    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
                    dateController.text = outputFormat.format(pickedDate);
                    startDate = pickedDate;
                    BlocProvider.of<OrganizedGroupCubit>(context).startDate = dateController.text;
                   
                    errorText = null;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: dateController2.text,
              outlineInputBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Themes.primary),
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: Icon(
                Icons.calendar_month,
                color: Colors.grey[600],
              ),
              controller: dateController2,
              onSaved: (value) {
                BlocProvider.of<OrganizedGroupCubit>(context).endDate = value;
              },
              onTap: () async {
                DateTime? pickedDate = await customDatePicker(context: context);
                if (pickedDate != null) {
                  setState(() {
                    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
                    if (startDate != null && pickedDate.isBefore(startDate!)) {
                      errorText = 'End date cannot be before start date';
                    } else {
                      dateController2.text = outputFormat.format(pickedDate);
                      endDate = pickedDate;
                      BlocProvider.of<OrganizedGroupCubit>(context).endDate = dateController2.text;
                      errorText = null;
                    }
                  });
                }
              },
            ),
            if (errorText != null) ...[
              const SizedBox(height: 16),
              Text(
                errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ],
          ],
        );
      },
    );
  }
}
