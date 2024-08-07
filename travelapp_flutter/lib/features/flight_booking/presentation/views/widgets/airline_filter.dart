import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/flight_booking/presentation/view_model/all_flights_cubit/all_flights_cubit.dart';

class AirlineFilter extends StatefulWidget {
  const AirlineFilter({super.key});
  @override
  State<AirlineFilter> createState() => _AirlineFilterState();
}

class _AirlineFilterState extends State<AirlineFilter> {
  String? currentAirline;
  @override
  void initState() {
    super.initState();
    currentAirline = BlocProvider.of<AllFlightsCubit>(context).airline;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'By Airline',
              style: Styles.heading2,
            ),
            IconButton(
              onPressed: restartAirline,
              icon: const Icon(
                FontAwesomeIcons.repeat,
                size: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        DropdownSearch(
          items: BlocProvider.of<AllFlightsCubit>(context).airlines,
          selectedItem: currentAirline,
          onChanged: onAirlineChange,
          dropdownBuilder: (context, selectedItem) {
            return Text(
              currentAirline ?? 'Choose airline',
              style: Styles.content.copyWith(fontSize: 16),
            );
          },
          popupProps: PopupProps.menu(
            isFilterOnline: true,
            showSearchBox: true,
            searchFieldProps: getSearchFieldStyle(),
            // menuProps: MenuProps(
            //   backgroundColor: Colors.grey,
            //   borderRadius: BorderRadius.circular(radius),
            // ),
          ),
        ),
      ],
    );
  }

  TextFieldProps getSearchFieldStyle() {
    return TextFieldProps(
      cursorColor: Themes.primary,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Themes.primary, width: 2),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Themes.primary),
        ),
      ),
    );
  }

  void onAirlineChange(newValue) {
    setState(() {
      currentAirline = newValue!;
      BlocProvider.of<AllFlightsCubit>(context).airline = newValue;
    });
  }

  void restartAirline() {
    setState(() {
      currentAirline = null;
      BlocProvider.of<AllFlightsCubit>(context).airline = null;
    });
  }
}
