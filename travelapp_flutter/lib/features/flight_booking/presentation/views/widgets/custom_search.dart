import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  List<dynamic> countries = [];
  List<dynamic> airLines = [];

  CustomSearch({required this.countries, required this.airLines});
  // [
  //   "Damascus",
  //   'Paris',
  //   "London",
  //   "Barcelona",
  //   "Roma",
  //   "Abu Dhabi",
  //   "Cairo"
  // ];

  // List? filterList = [];

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
    List? filterList = [];

    if (query == "") {
      return ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, i) {
            return InkWell(
                onTap: () {
                  close(context, countries[i]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${countries[i]}',
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
      filterList = countries
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: filterList.length,
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



