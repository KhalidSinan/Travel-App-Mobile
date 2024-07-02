import 'package:flutter/material.dart';
import 'package:travelapp_flutter/core/utils/themes.dart';

const tabsStyle = TextStyle(color: Colors.white, fontSize: 15);

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // elevation: 5,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12)),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicator:
              //  UnderlineTabIndicator(
              //     borderSide: BorderSide(width: 5),
              //     insets: EdgeInsets.symmetric(horizontal: 3)),
              BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Themes.primary),
          unselectedLabelColor: Colors.black87,
          labelColor: Colors.white,
          controller: tabController,
          isScrollable: false,
          labelPadding: EdgeInsets.zero,
          tabs: const [
            Tab(
              child: Text(
                ' One Way ',
                //style: tabsStyle,
              ),
            ),
            Tab(
              child: Text(
                ' Two Way ',
                //style: tabsStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
