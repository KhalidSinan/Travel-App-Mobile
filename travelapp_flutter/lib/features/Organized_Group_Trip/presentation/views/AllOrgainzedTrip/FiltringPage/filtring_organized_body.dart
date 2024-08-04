import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/orgainzed_group_trip_cubit.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/view_model/OrganizedGroupTripCubit/organized_group_trip_states.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/FiltringPage/date_calender_filter.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/FiltringPage/price_filter_organized_trip.dart';

class FiltringOrganizedBody extends StatefulWidget {
  const FiltringOrganizedBody({super.key});

  @override
  _FiltringOrganizedBodyState createState() => _FiltringOrganizedBodyState();
}

class _FiltringOrganizedBodyState extends State<FiltringOrganizedBody> {
  final List<String> chipLabels = [
    'Entertainment',
    'Exploratory',
    'Therapeutic',
    'Artistic',
    'Educational',
  ];

  final List<bool> selected = [false, false, false, false, false];

  final Map<String, List<String>> continentCountries = {
    'Africa': [
      "Algeria",
      "Angola",
      "Benin",
      "Botswana",
      "Burkina Faso",
      "Burundi",
      "Cape Verde",
      "Cameroon",
      "Central African Republic",
      "Chad",
      "Comoros",
      "Republic of the Congo",
      "Democratic Republic of the Congo",
      "Djibouti",
      "Egypt",
      "Equatorial Guinea",
      "Eritrea",
      "Eswatini",
      "Ethiopia",
      "Gabon",
      "The Gambia",
      "Ghana",
      "Guinea",
      "Guinea-Bissau",
      "Ivory Coast",
      "Kenya",
      "Lesotho",
      "Liberia",
      "Libya",
      "Madagascar",
      "Malawi",
      "Mali",
      "Mauritania",
      "Mauritius",
      "Morocco",
      "Mozambique",
      "Namibia",
      "Niger",
      "Nigeria",
      "Rwanda",
      "São Tomé and Príncipe",
      "Senegal",
      "Seychelles",
      "Sierra Leone",
      "Somalia",
      "South Africa",
      "South Sudan",
      "Sudan",
      "Tanzania",
      "Togo",
      "Uganda",
      "Zambia",
      "Zimbabwe"
    ],
    'Asia': [
      "Afghanistan",
      "Armenia",
      "Azerbaijan",
      "Bahrain",
      "Bangladesh",
      "Bhutan",
      "Brunei",
      "Cambodia",
      "China",
      "Cyprus",
      "Georgia",
      "India",
      "Indonesia",
      "Iran",
      "Iraq",
      "Israel",
      "Japan",
      "Jordan",
      "Kazakhstan",
      "Kuwait",
      "Kyrgyzstan",
      "Laos",
      "Lebanon",
      "Malaysia",
      "Maldives",
      "Mongolia",
      "Nepal",
      "Oman",
      "Pakistan",
      "Palestine",
      "Qatar",
      "Saudi Arabia",
      "Singapore",
      "Sri Lanka",
      "Syria",
      "Tajikistan",
      "Thailand",
      "Turkmenistan",
      "United Arab Emirates",
      "Uzbekistan",
      "Vietnam",
      "Yemen"
    ],
    'Europe': [
      "Åland Islands",
      "Albania",
      "Andorra",
      "Austria",
      "Belarus",
      "Belgium",
      "Bosnia and Herzegovina",
      "Bulgaria",
      "Croatia",
      "Cyprus",
      "Czech Republic",
      "Denmark",
      "Estonia",
      "Finland",
      "France",
      "Georgia",
      "Germany",
      "Greece",
      "Hungary",
      "Iceland",
      "Ireland",
      "Italy",
      "Kosovo",
      "Latvia",
      "Liechtenstein",
      "Lithuania",
      "Luxembourg",
      "Malta",
      "Monaco",
      "Montenegro",
      "Netherlands",
      "North Macedonia",
      "Norway",
      "Poland",
      "Portugal",
      "Romania",
      "Russia",
      "San Marino",
      "Serbia",
      "Slovakia",
      "Slovenia",
      "Sweden",
      "Switzerland"
    ],
    'North America': [
      "American Samoa",
      "Anguilla",
      "Barbados",
      "Bermuda",
      "Canada",
      "Cayman Islands",
      "Cuba",
      "Dominica",
      "Dominican Republic",
      "Guatemala",
      "Haiti",
      "Honduras",
      "Jamaica",
      "Mexico",
      "Nicaragua",
      "Panama",
      "Puerto Rico",
      "Saint Kitts and Nevis",
      "Saint Lucia",
      "Saint Martin",
      "Saint Vincent and the Grenadines",
      "Sint Maarten",
      "Trinidad and Tobago",
      "United States",
      "Virgin Islands (British)",
      "Virgin Islands (U.S.)"
    ],
    'South America': [
      "Argentina",
      "Bolivia",
      "Brazil",
      "Chile",
      "Colombia",
      "Ecuador",
      "Guyana",
      "Paraguay",
      "Peru",
      "Suriname",
      "Uruguay",
      "Venezuela"
    ],
    'Australia (Oceania)': [
      "Australia",
      "Fiji",
      "Kiribati",
      "Marshall Islands",
      "Micronesia",
      "Nauru",
      "New Caledonia",
      "New Zealand",
      "Papua New Guinea",
      "Samoa",
      "Solomon Islands",
      "Tonga",
      "Tuvalu",
      "Vanuatu"
    ],
    'Antarctica': ["Antarctica"],
  };

  final Map<String, List<bool>> continentSelected = {
    'Africa': [],
    'Asia': [],
    'Europe': [],
    'North America': [],
    'South America': [],
    'Australia (Oceania)': [],
    'Antarctica': [],
  };

  @override
  void initState() {
    super.initState();
    continentCountries.forEach((continent, countries) {
      continentSelected[continent] = List<bool>.filled(countries.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizedGroupCubit, OrganizedGroupCubitState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Date:',
                    style: Styles.heading2.copyWith(color: Colors.black)),
                const SizedBox(height: 16),
                const DateFiltering(),
                const SizedBox(height: 16),
                const PriceFilterTripGroup(),
                const SizedBox(height: 16),
                Text('Select Types:',
                    style: Styles.heading2.copyWith(color: Colors.black)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children:
                      List<Widget>.generate(chipLabels.length, (int index) {
                    return ChoiceChip(
                      label: Text(
                        chipLabels[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      selected: BlocProvider.of<OrganizedGroupCubit>(context)
                          .selectedTypes
                          .contains(chipLabels[index]),
                      onSelected: (bool isSelected) {
                        BlocProvider.of<OrganizedGroupCubit>(context)
                            .updateSelectedTypes(chipLabels[index], isSelected);
                      },
                      selectedColor: const Color(0xffffb156),
                      backgroundColor: const Color(0xff205E61).withOpacity(0.9),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Text('Select Countries:',
                    style: Styles.heading2.copyWith(color: Colors.black)),
                const SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: continentCountries.entries.map((entry) {
                    String continent = entry.key;
                    List<String> countries = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          continent,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: List<Widget>.generate(countries.length,
                              (int index) {
                            return ChoiceChip(
                              label: Text(
                                countries[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                              selected:
                                  BlocProvider.of<OrganizedGroupCubit>(context)
                                      .selectedCountries
                                      .contains(countries[index]),
                              onSelected: (bool isSelected) {
                                BlocProvider.of<OrganizedGroupCubit>(context)
                                    .updateSelectedCountries(
                                        countries[index], isSelected);

                                for (var i = 0;
                                    i <
                                        BlocProvider.of<OrganizedGroupCubit>(
                                                context)
                                            .selectedCountries
                                            .length;
                                    i++) {
                                  print(BlocProvider.of<OrganizedGroupCubit>(
                                          context)
                                      .selectedCountries[i]);
                                }
                              },
                              selectedColor: const Color(0xffffb156),
                              backgroundColor:
                                  const Color(0xff205E61).withOpacity(0.9),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(
                        onPressed: () async {
                          await BlocProvider.of<OrganizedGroupCubit>(context)
                              .getAllOrganizedTrips(
                                  startDate: BlocProvider.of<OrganizedGroupCubit>(
                                          context)
                                      .startDate,
                                  endDate: BlocProvider.of<OrganizedGroupCubit>(
                                          context)
                                      .endDate,
                                  startPrice: BlocProvider.of<
                                          OrganizedGroupCubit>(context)
                                      .minPrice,
                                  endPrice: BlocProvider.of<
                                          OrganizedGroupCubit>(context)
                                      .maxPrice,
                                  types: BlocProvider.of<OrganizedGroupCubit>(
                                          context)
                                      .selectedTypes,
                                  countries:
                                      BlocProvider.of<OrganizedGroupCubit>(
                                              context)
                                          .selectedCountries);
                          Get.back();
                        },
                        label: "Apply Filtering"))
              ],
            ),
          ),
        );
      },
    );
  }
}
