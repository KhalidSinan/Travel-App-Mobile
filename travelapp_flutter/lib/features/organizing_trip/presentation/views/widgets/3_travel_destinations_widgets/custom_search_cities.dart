import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';
import 'package:travelapp_flutter/features/organizing_trip/data/models/cities_airline_model.dart';

class CustomSearchCities extends SearchDelegate {
  final List<CountryModel> countries;

  CustomSearchCities({required this.countries});

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
        for (var city in country.cities) {
          filteredCities.add({"city": city, "country": country.countryName});
        }
      }
    } else {
      for (var country in countries) {
        for (var city in country.cities) {
          if (city.toLowerCase().contains(query.toLowerCase())) {
            filteredCities.add({"city": city, "country": country.countryName});
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
            close(context, {
              "city": filteredCities[index]["city"],
              "country": filteredCities[index]['country'],
            });
          },
        );
      },
    );
  }
}
