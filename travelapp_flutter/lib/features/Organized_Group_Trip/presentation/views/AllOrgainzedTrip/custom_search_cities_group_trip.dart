import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomSearchCitiesGroupTrip extends SearchDelegate {
  // final List<> countries;
//{required this.countries}
final List<String> countries =[
  "Syria",
  "America",
  "Japan",
  "Korea",
  "China"
];
  CustomSearchCitiesGroupTrip();

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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, String>> filteredCities = [];

    if (query.isEmpty) {
      for (var country in countries) {
        for (var city in countries) {
          filteredCities.add({"city": city, "country": country});
        }
      }
    } else {
      for (var country in countries) {
        for (var city in countries) {
          if (city.toLowerCase().contains(query.toLowerCase())) {
            filteredCities.add({"city": city, "country": country});
          }
        }
      }
    }

    return ListView.builder(
      itemCount: filteredCities.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            size: 18,
            FontAwesomeIcons.city,
            color: Themes.primary,
          ),
          title: Text(filteredCities[index]["city"]!),
          subtitle: Text(filteredCities[index]["country"]!),
          onTap: () {
            close(context, filteredCities[index]["city"]);
          },
        );
      },
    );
  }
}
