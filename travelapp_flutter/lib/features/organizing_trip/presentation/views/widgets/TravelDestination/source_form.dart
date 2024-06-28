import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/view_model/organizing_trip_cubit/organizing_trip.dart';
import 'package:travelapp_flutter/features/organizing_trip/presentation/views/widgets/TravelDestination/custom_search_cities.dart';


class SourceForm extends StatefulWidget {
  @override
  State<SourceForm> createState() => _SourceFormState();
}

class _SourceFormState extends State<SourceForm> {
  String? src;
  TextEditingController searchController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Source',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: CustomTextFormField(
              outlineInputBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Themes.primary),
              ),
              prefixIcon: const Icon(Icons.flight_takeoff_outlined),
              onTap: () async {
                print(BlocProvider.of<OrganizingTripCubit>(context).cities);
                var searchResult = await showSearch(
                  context: context,
                  delegate: CustomSearchCities(
                    countries:
                        BlocProvider.of<OrganizingTripCubit>(context).cities,
                  ),
                );
                print("=================================================");
                if (searchResult != null) {
                  setState(() {
                    searchController1.text = searchResult.toString();
                  });
                }
              },
              controller: searchController1,
              onSaved: (value) => src = value,
              validator: validateName,
            ),
          ),
        ],
      ),
    );
  }
}
