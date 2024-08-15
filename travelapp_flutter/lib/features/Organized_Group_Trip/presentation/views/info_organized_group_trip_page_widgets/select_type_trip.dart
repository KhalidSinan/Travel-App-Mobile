import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/utils/constants.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/reservation_ticket_cubit/reservation_ticket_cubit.dart';

class SelectTypeTrip extends StatefulWidget {
  const SelectTypeTrip({
    super.key,
    this.text,
    required this.onAddType,
  });
  final String? text;
  final void Function(String type) onAddType;

  @override
  State<SelectTypeTrip> createState() => _SelectTypeTripState();
}

class _SelectTypeTripState extends State<SelectTypeTrip> {
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10),
            child: Text(
              widget.text ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(radius)),
            child: SizedBox(
              height: 60,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButtonFormField(
                  items: [
                    "Entertainment",
                    "Exploratory",
                    "Therapeutic",
                    "Artistic",
                    "Educational"
                  ]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  validator: (value) => value == null ? 'field required' : null,
                  onChanged: (val) {
                    widget.onAddType(val!);
                    selectedType = null;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Themes.primary)),
                      focusedBorder: const UnderlineInputBorder()),
                  value: selectedType,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'double tap to remove',
            style: Styles.subtitle,
          ),
        ],
      ),
    );
  }
}
