import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/helpers/validators.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_text_form_field.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/FiltringPage/filtring_organized_trip_page.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/custom_search_cities_group_trip.dart';

class OptionsSearchAndFilter extends StatefulWidget {
  const OptionsSearchAndFilter({super.key});

  @override
  State<OptionsSearchAndFilter> createState() => _OptionsSearchAndFilterState();
}

class _OptionsSearchAndFilterState extends State<OptionsSearchAndFilter> {
  String? src;
  TextEditingController searchController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              outlineInputBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Themes.primary),
                  borderRadius: BorderRadius.circular(15)),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(top: 15, left: 16),
                child: Text("Search by source city"),
              ),
              onTap: () async {
                var searchResult = await showSearch(
                  context: context,
                  delegate: CustomSearchCitiesGroupTrip(),
                );
                if (searchResult != null) {
                  setState(() {
                    searchController1.text = searchResult.toString();
                  });
                }
              },
              controller: searchController1,
              onSaved: (value) {
                src = value;
              },
              validator: validateName,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          IconButton(
            onPressed: () {
              Get.to(const FilteringPage());
            },
            style: IconButton.styleFrom(),
            icon: Icon(
              size: 30,
              FontAwesomeIcons.filter,
              color: Themes.third,
            ),
          ),
        ],
      ),
    );
  }
}
