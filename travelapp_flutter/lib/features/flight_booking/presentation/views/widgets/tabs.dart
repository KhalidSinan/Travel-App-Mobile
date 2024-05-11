import 'package:flutter/material.dart';

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
          indicator: const
              //  UnderlineTabIndicator(
              //     borderSide: BorderSide(width: 5),
              //     insets: EdgeInsets.symmetric(horizontal: 3)),
              BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Color(0xff205E61)),
          controller: tabController,
          isScrollable: false,
          labelPadding: EdgeInsets.zero,
          tabs: const [
            Tab(
              child: Text(
                ' One Way ',
                style: tabsStyle,
              ),
            ),
            Tab(
              child: Text(
                ' Two Way ',
                style: tabsStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
