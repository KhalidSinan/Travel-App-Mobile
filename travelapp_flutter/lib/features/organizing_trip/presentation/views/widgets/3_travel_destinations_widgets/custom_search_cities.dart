import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/cities_airline_model.dart';

class CustomSearchCities extends SearchDelegate {
  List<CountryModel> countries = [];

  CustomSearchCities({
    required this.countries,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CountryModel> filterList = [];

    if (query.isEmpty) {
      return ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, countryIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "  ${countries[countryIndex].countryName}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Themes.primary),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: countries[countryIndex].cities.length,
                    itemBuilder: (context, cityIndex) {
                      if (countries[countryIndex].cities == []) {
                        return const Text("There are no cities");
                      } else {
                        return ListTile(
                          leading: Icon(
                            size: 18,
                            FontAwesomeIcons.city,
                            color: Themes.primary,
                          ),
                          title:
                              Text(countries[countryIndex].cities[cityIndex]),
                          subtitle: Text(countries[countryIndex].countryName),
                          onTap: () {
                            close(context,
                                countries[countryIndex].cities[cityIndex]);
                          },
                        );
                      }
                    },
                  ),
                  Divider(
                    thickness: 1,
                    color: Themes.primary,
                  )
                ],
              ),
            );
          });
    } else {
      filterList = countries.where((country) {
        return country.cities
            .any((city) => city.toLowerCase().contains(query.toLowerCase()));
      }).toList();

      return ListView.builder(
          itemCount: filterList.length,
          itemBuilder: (context, countryIndex) {
            return Column(
              children: [
                Text(filterList[countryIndex].countryName),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filterList[countryIndex].cities.length,
                  itemBuilder: (context, cityIndex) {
                    return ListTile(
                      title: Text(filterList[countryIndex].cities[cityIndex]),
                      onTap: () {
                        close(context,
                            filterList[countryIndex].cities[cityIndex]);
                      },
                    );
                  },
                ),
                const Divider(
                  thickness: 1,
                )
              ],
            );
          });
    }
  }
}
