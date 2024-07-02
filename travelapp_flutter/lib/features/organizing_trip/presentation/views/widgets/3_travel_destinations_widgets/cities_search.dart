import 'package:flutter/material.dart';

class CitiesSearch extends SearchDelegate {
  List<dynamic> countries = [];
  CitiesSearch({required this.countries});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
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
        country.add(countries[i].country);
        cities.add(countries[i].country);
        sum += 1;
      } else {
        for (int j = 0; j < countries[i].cities.length; j++) {
          country.add(countries[i].country);
          cities.add(countries[i].cities[j]);
        }
      }
    }
    if (query == "") {
      return ListView.builder(
        itemCount: sum.toInt(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              close(context, cities[index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                children: [
                  ListTile(
                    leading: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.location_city_sharp,
                        size: 28,
                        color: Colors.black54,
                      ),
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
                    indent: 55,
                    endIndent: 40,
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      return Text('');
      // List? filterList = [];
      // filterList = cities
      //     .where(
      //         (element) => element.toLowerCase().contains(query.toLowerCase()))
      //     .toList();
      // return ListView.builder(
      //   itemCount: filterList.length,
      //   itemBuilder: (context, index) {
      //     return InkWell(
      //       onTap: () {
      //         close(context, filterList![index]);
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.only(left: 16),
      //         child: Column(
      //           children: [
      //             ListTile(
      //               title: Text(
      //                 filterList![index],
      //                 style: const TextStyle(
      //                     fontWeight: FontWeight.bold, fontSize: 18),
      //               ),
      //             ),
      //             const Divider(
      //               indent: 44,
      //               endIndent: 40,
      //             )
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // );
    }
  }
}
