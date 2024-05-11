import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
<<<<<<< HEAD
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
=======
  List<dynamic> countries = [];
    List<dynamic> airLines = [];

  CustomSearch({required this.countries , required this.airLines});
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
>>>>>>> Khalid

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
<<<<<<< HEAD
    if (query == "") {
      return ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, i) {
            return InkWell(
                onTap: () {
                  close(context, cities[i]);
=======
    List? filterList = [];

    if (query == "") {
      return ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, i) {
            return InkWell(
                onTap: () {
                  close(context, countries[i]);
>>>>>>> Khalid
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
<<<<<<< HEAD
                          cities[i],
=======
                          '${countries[i]}',
>>>>>>> Khalid
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
<<<<<<< HEAD
      filterList = cities
=======
      filterList = countries
>>>>>>> Khalid
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return ListView.builder(
<<<<<<< HEAD
          itemCount: filterList!.length,
=======
          itemCount: filterList.length,
>>>>>>> Khalid
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