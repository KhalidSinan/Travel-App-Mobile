import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class AirlineFilter extends StatefulWidget {
  const AirlineFilter({super.key});

  @override
  State<AirlineFilter> createState() => _AirlineFilterState();
}

class _AirlineFilterState extends State<AirlineFilter> {
  String currentAirline = 'Airline 1';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'By Airline',
          style: Styles.heading2,
        ),
        const SizedBox(height: 8),
        DropdownButton(
          value: currentAirline,
          elevation: 0,
          dropdownColor: Themes.third,
          isExpanded: true,
          underline: Divider(
            color: Themes.third,
            height: 8,
            thickness: 2,
          ),
          items: getAirlines(),
          onChanged: onAirlineChange,
        ),
      ],
    );
  }

  void onAirlineChange(newValue) {
    setState(() {
      currentAirline = newValue!;
    });
  }

  List<DropdownMenuItem<String>> getAirlines() {
    return List.generate(4, (index) {
      return DropdownMenuItem(
        value: 'Airline ${index + 1}',
        child: Text('Airline ${index + 1}'),
      );
    });
  }
}
