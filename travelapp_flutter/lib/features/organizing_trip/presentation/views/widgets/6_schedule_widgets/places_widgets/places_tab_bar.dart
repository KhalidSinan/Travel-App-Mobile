import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

class PlacesTabBar extends StatelessWidget {
  const PlacesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> categories = [
      const Tab(
        child: Row(
          children: [
            Text('Restaurant'),
            SizedBox(width: 7),
            Icon(Icons.restaurant_outlined),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Attraction'),
            SizedBox(width: 7),
            Icon(Icons.account_balance),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Cinema'),
            SizedBox(width: 7),
            Icon(Icons.theaters),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Adventure'),
            SizedBox(width: 7),
            Icon(Icons.attractions),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Museum'),
            SizedBox(width: 7),
            Icon(Icons.museum),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Mall'),
            SizedBox(width: 7),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Stadium'),
            SizedBox(width: 7),
            Icon(Icons.stadium),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Market'),
            SizedBox(width: 7),
            Icon(Icons.store_mall_directory),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Park'),
            SizedBox(width: 7),
            Icon(Icons.park),
          ],
        ),
      ),
      const Tab(
        child: Row(
          children: [
            Text('Street'),
            SizedBox(width: 7),
            Icon(FontAwesomeIcons.road),
          ],
        ),
      ),
    ];
    return TabBar(
      padding: const EdgeInsets.only(top: 15),
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      tabAlignment: TabAlignment.start,
      splashFactory: InkSplash.splashFactory,
      splashBorderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      labelStyle: const TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
      unselectedLabelColor: Themes.primary,
      indicator: BoxDecoration(
        color: Themes.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 5,
      dividerHeight: 1.5,
      tabs: categories,
    );
  }
}
