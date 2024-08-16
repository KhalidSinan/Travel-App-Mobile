import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class CustomSearchCitiesGroupTrip extends SearchDelegate {
  final List<String> countries;

  CustomSearchCitiesGroupTrip({required this.countries});

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
    print(countries);
    List<String> filteredCountries = query.isEmpty
        ? countries
        : countries
            .where((country) =>
                country.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: filteredCountries.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            FontAwesomeIcons.flag,
            size: 18,
            color: Themes.primary,
          ),
          title: Text(filteredCountries[index]),
          onTap: () {
            close(context, filteredCountries[index]);
          },
        );
      },
    );
  }
}
