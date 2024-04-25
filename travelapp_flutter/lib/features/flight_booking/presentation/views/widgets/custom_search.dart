import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List cities = [
    "Damascus",
    'Paris',
    "London",
    "Barcelona",
    "Roma",
    "Abu Dhabi",
    "Cairo"
  ];

  List? filterList = [];

  static String? test;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
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
    if (query == "") {
      return ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, i) {
            return InkWell(
                onTap: () {
                  close(context, cities[i]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          cities[i],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        leading: const Icon(Icons.airplanemode_on_sharp),
                      ),
                      const Divider(
                        indent: 44,
                        endIndent: 40,
                        thickness: 2,
                      )
                    ],
                  ),
                ));
          });
    } else {
      filterList = cities
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: filterList!.length,
          itemBuilder: (context, i) {
            return InkWell(
                onTap: () {
                  close(context, filterList![i]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          filterList![i],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        leading: const Icon(Icons.airplanemode_on_sharp),
                      ),
                      const Divider(
                        indent: 44,
                        endIndent: 40,
                        thickness: 2,
                      )
                    ],
                  ),
                ));
          });
    }
  }
}



// Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     '${cities[i]}',
//                     style: const TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),