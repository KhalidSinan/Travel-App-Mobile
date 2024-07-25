import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class LocationCities extends SearchDelegate {
  List<dynamic> countries = [];
  LocationCities({required this.countries});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    num sum = 0;
    List<String> cities = [];
    List<String> country = [];

    for (int i = 0; i < 249; i++) {
      sum += countries[i].cities.length;
      if (countries[i].cities.isEmpty) {
        country.add(countries[i].countryName);
        cities.add(countries[i].countryName);
        sum += 1;
      } else {
        for (int j = 0; j < countries[i].cities.length; j++) {
          country.add(countries[i].countryName);
          cities.add(countries[i].cities[j]);
        }
      }
    }
    if (query == "") {
      return ListView.builder(
        itemCount: sum.toInt(),
        itemBuilder: (context, index) {
          List<String> result = [(cities[index]), (country[index])];
          return InkWell(
            onTap: () {
              close(context, result);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                    leading: Icon(
                      Icons.location_city,
                      color: Themes.primary,
                      size: 30,
                    ),
                    title: Text(
                      cities[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      country[index],
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  const Divider(
                    height: 5,
                    indent: 20,
                    endIndent: 30,
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      List? filterList = [];
      filterList = cities
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              close(context, filterList![index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                    leading: Icon(
                      Icons.location_city,
                      color: Themes.primary,
                      size: 30,
                    ),
                    title: Text(
                      cities[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text(
                      country[index],
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  const Divider(
                    height: 5,
                    indent: 20,
                    endIndent: 30,
                  )
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
