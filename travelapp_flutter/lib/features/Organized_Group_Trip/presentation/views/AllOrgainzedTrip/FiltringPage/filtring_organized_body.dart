import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp_flutter/core/utils/styles.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/core/widgets/custom_button.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/FiltringPage/date_calender_filter.dart';
import 'package:travelapp_flutter/features/Organized_Group_Trip/presentation/views/AllOrgainzedTrip/FiltringPage/price_filter_organized_trip.dart';

class FiltringOrganizedBody extends StatefulWidget {
  const FiltringOrganizedBody({super.key});

  @override
  _FiltringOrganizedBodyState createState() => _FiltringOrganizedBodyState();
}

class _FiltringOrganizedBodyState extends State<FiltringOrganizedBody> {
  final List<String> chipLabels = [
    'Educational',
    'Artistic',
    'Exploratory',
    'Therapeutic',
    'Entertainment',
  ];

  final List<bool> selected = [false, false, false, false, false];

  final Map<String, List<String>> continentCountries = {
    'Africa': [
      " Algeria",
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
      "Democratic Republic of the Congo",
      "Djibouti",
      "Egypt",
      "Equatorial Guinea",
      "Eritrea",
      "Eswatini",
      "Ethiopia",
      "Gabon",
      "Gambia",
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
      "Republic of the Congo",
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
      "Tunisia",
      "Uganda",
      "Zambia",
      "Zimbabwe"
    ],
    'Asia': [
      'Afghanistan',
      'Armenia',
      'Azerbaijan',
      'Bahrain',
      'Bangladesh',
      'Bhutan',
      'Brunei',
      'Cambodia',
      'China',
      'Cyprus',
      'Georgia',
      'India',
      'Indonesia',
      'Iran',
      'Iraq',
      'Israel',
      'Japan',
      'Jordan',
      'Kazakhstan',
      'Kuwait',
      'Kyrgyzstan',
      'Laos',
      'Lebanon',
      'Malaysia',
      'Maldives',
      'Mongolia',
      'Myanmar (Burma)',
      'Nepal',
      'North Korea',
      'Oman',
      'Pakistan',
      'Palestine',
      'Philippines',
      'Qatar',
      'Saudi Arabia',
      'Singapore',
      'South Korea',
      'Sri Lanka',
      'Syria',
      'Taiwan',
      'Tajikistan',
      'Thailand',
      'Timor-Leste (East Timor)',
      'Turkey',
      'Turkmenistan',
      'United Arab Emirates',
      'Uzbekistan',
      'Vietnam',
      'Yemen',
    ],
    'Europe': [
      'Albania',
      'Andorra',
      'Austria',
      'Belarus',
      'Belgium',
      'Bosnia and Herzegovina',
      'Bulgaria',
      'Croatia',
      'Cyprus',
      'Czech Republic',
      'Denmark',
      'Estonia',
      'Finland',
      'France',
      'Georgia',
      'Germany',
      'Greece',
      'Hungary',
      'Iceland',
      'Ireland',
      'Italy',
      'Kosovo',
      'Latvia',
      'Liechtenstein',
      'Lithuania',
      'Luxembourg',
      'Malta',
      'Moldova',
      'Monaco',
      'Montenegro',
      'Netherlands',
      'North Macedonia',
      'Norway',
      'Poland',
      'Portugal',
      'Romania',
      'Russia',
      'San Marino',
      'Serbia',
      'Slovakia',
      'Slovenia',
      'Spain',
      'Sweden',
      'Switzerland',
      'Ukraine',
      'United Kingdom',
      'Vatican City',
    ],
    'North America': [
      'Antigua and Barbuda',
      'Bahamas',
      'Barbados',
      'Belize',
      'Canada',
      'Costa Rica',
      'Cuba',
      'Dominica',
      'Dominican Republic',
      'El Salvador',
      'Grenada',
      'Guatemala',
      'Haiti',
      'Honduras',
      'Jamaica',
      'Mexico',
      'Nicaragua',
      'Panama',
      'Saint Kitts and Nevis',
      'Saint Lucia',
      'Saint Vincent and the Grenadines',
      'Trinidad and Tobago',
      'United States',
    ],
    'South America': [
      'Argentina',
      'Bolivia',
      'Brazil',
      'Chile',
      'Colombia',
      'Ecuador',
      'Guyana',
      'Paraguay',
      'Peru',
      'Suriname',
      'Uruguay',
      'Venezuela',
    ],
    'Australia (Oceania)': [
      'Australia',
      'Fiji',
      'Kiribati',
      'Marshall Islands',
      'Micronesia',
      'Nauru',
      'New Zealand',
      'Palau',
      'Papua New Guinea',
      'Samoa',
      'Solomon Islands',
      'Tonga',
      'Tuvalu',
      'Vanuatu',
    ],
    'Antarctica': ['No countries, only territorial claims by various nations.'],
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
              children: List<Widget>.generate(chipLabels.length, (int index) {
                return ChoiceChip(
                  label: Text(
                    chipLabels[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                  selected: selected[index],
                  onSelected: (bool isSelected) {
                    setState(() {
                      selected[index] = isSelected;
                    });
                  },
                  selectedColor: const Color(0xffffb156),
                  backgroundColor: Color(0xff205E61),
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

                if (continent == 'Antarctica') {
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
                      // Display text instead of chips for Antarctica
                      Text(
                        'No countries, only territorial claims by various nations.',
                        style: TextStyle(fontSize: 16, color: Themes.third),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }
                // For other continents
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
                      children:
                          List<Widget>.generate(countries.length, (int index) {
                        return ChoiceChip(
                          label: Text(
                            countries[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                          selected: continentSelected[continent]![index],
                          onSelected: (bool isSelected) {
                            setState(() {
                              continentSelected[continent]![index] = isSelected;
                            });
                          },
                          selectedColor: const Color(0xffffb156),
                          backgroundColor: const Color(0xff205E61),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ),
            SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: CustomButton(onPressed: () {}, label: "Apply Filtring"))
          ],
        ),
      ),
    );
  }
}
